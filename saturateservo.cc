#include <assert.h>
#include <math.h>
#include <unistd.h>

#include "saturateservo.hh"
#include "socket.hh"
#include "payload.hh"
#include "acker.hh"

SaturateServo::SaturateServo( const char * s_name,
                              FILE* ack_log_file,
                              FILE* data_log_file,
			      const Socket & s_listen,
			      const Socket & s_send,
			      const Socket::Address & s_remote,
			      const bool s_server,
			      const int s_send_id)
  : _name( s_name ),
    _ack_log_file(ack_log_file),
    _data_log_file(data_log_file),
    _listen( s_listen ),
    _send( s_send ),
    _remote( s_remote ),
    _server( s_server ),
    _send_id( s_send_id ),
    _acker( NULL ),
    _next_transmission_time( Socket::timestamp() ),
    _foreign_id( -1 ),
    _packets_sent( 0 ),
    _max_ack_id( -1 ),
    _window_size(100),
    _window( LOWER_WINDOW ),
    _pkt_intval(-1 ),
    _con_time_s(-1),
    _nof_pkt(30000) 
{}

bool SaturateServo::recv_noACK( void )
{
    /* get the ack packet */
    Socket::Packet incoming( _listen.recv() );
    fixRatePayload *contents = (fixRatePayload *) incoming.payload.data();
    _pkt_intval = contents->pkt_intval;
    _con_time_s = contents->con_time_s;
    _nof_pkt	= contents->nof_pkt;
    printf("recv: pkt_intval:%d con_time_s:%d nof_pkt:%d\n",_pkt_intval,_con_time_s,_nof_pkt);
    if ( (contents->magic_number = 12345) ) {
	_remote = incoming.addr;
    }
    
    return contents->CON_CLOSE; 
}

void SaturateServo::recv( void )
{
  /* get the ack packet */
  Socket::Packet incoming( _listen.recv() );
  SatPayload *contents = (SatPayload *) incoming.payload.data();
  contents->recv_timestamp = incoming.timestamp;

  if ( contents->sequence_number != -1 ) {
    /* not an ack */
    printf( "MARTIAN!\n" );
    return;
  }

  /* possibly roam */
  if ( _server ) {
      if ( (contents->sender_id > _foreign_id) && (contents->ack_number == -1) ) {
	_foreign_id = contents->sender_id;
	_remote = incoming.addr;
      }
  }

  /* process the ack */
  if ( contents->sender_id != _send_id ) {
    /* not from us */
    return;
  } else {
    if ( contents->ack_number > _max_ack_id ) {
      _max_ack_id = contents->ack_number;
    }


    //int64_t rtt_ns = contents->recv_timestamp - contents->sent_timestamp;
    //double rtt = rtt_ns / 1.e9;

// Yaxiong's code
    //int64_t oneway_ns = contents->oneway_ns;
    //double oneway_delay = oneway_ns / 1.e9;
    //int thput = 40000000;
    //double bits_sent = thput * oneway_delay;
    //double bits_sent = thput * LOWER_RTT;
    //int window_size = (int) floor( bits_sent / (1500 * 8) );
    //int window_size = 100; 
   /* increase-decrease rules */

    if (_window < _window_size){
	_window++;
    }
    if (_window > _window_size){
	_window -= 20;
    }   
// End of Yaxiong's code
//fprintf(_ack_log_file,"%d %ld %ld %ld\n",contents->ack_number,contents->recv_timestamp,contents->sent_timestamp,rtt_ns); 
 /*   fprintf( _log_file, "%s ACK RECEIVED senderid=%d, seq=%d, send_time=%ld,  recv_time=%ld, rtt=%.4f, %d => ",
       _name.c_str(),_server ? _foreign_id : contents->sender_id , contents->ack_number, contents->sent_timestamp, contents->recv_timestamp, (double)rtt,  _window );
 
    if ( (rtt < LOWER_RTT) && (_window < UPPER_WINDOW) ) {
      _window++;
    }

    if ( (rtt > UPPER_RTT) && (_window > LOWER_WINDOW + 10) ) {
      _window -= 20;
    }
*/
    //printf( "ACK RECEIVED senderid=%d ack_num=%d pkt_sent=%d pkt_OTA=%d RTT:%f OneWay:%f WINDOW:%d targetW:%d\n",
//	  contents->sender_id, contents->ack_number,_packets_sent, _packets_sent - contents->ack_number, rtt, oneway_delay, _window, _window_size); 
    //fprintf( _ack_log_file, "%d\t %d\t %d\t %d\t %ld\t %ld\t %f\t %f\t %d\t %d\t\n",
//	  contents->sender_id, contents->ack_number,_packets_sent, _packets_sent - contents->ack_number, contents->sent_timestamp, contents->recv_timestamp, rtt, oneway_delay, _window, _window_size); 
    //fprintf( _log_file, "%d\n", _window );
  }
}

uint64_t SaturateServo::wait_time( void ) const
{
  int num_outstanding = _packets_sent - _max_ack_id - 1;

  if ( _remote == UNKNOWN ) {
    return 1000000000;
  }

  if ( num_outstanding < _window ) {
    return 0;
  } else {
    int diff = _next_transmission_time - Socket::timestamp();
    if ( diff < 0 ) {
      diff = 0;
    }
    return diff;
  }
}

void SaturateServo::tick( void )
{
  if ( _remote == UNKNOWN ) {
    return;
  }

  int num_outstanding = _packets_sent - _max_ack_id - 1;

  if ( num_outstanding < _window ) {
    /* send more packets */
    int amount_to_send = _window - num_outstanding;
    for ( int i = 0; i < amount_to_send; i++ ) {
      SatPayload outgoing;
      outgoing.sequence_number = _packets_sent;
      outgoing.ack_number = -1;
      outgoing.sent_timestamp = Socket::timestamp();
      outgoing.recv_timestamp = 0;
      outgoing.oneway_ns = 0;
      outgoing.sender_id = _send_id;

      _send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );
      
      printf( "DATA SENT  seq=%d, send_time=%ld, recv_time=%ld window:%d\n", outgoing.sequence_number, outgoing.sent_timestamp, outgoing.recv_timestamp, _window ); 

      _packets_sent++;
      //fprintf( _data_log_file, "%d\t %d\t %d\t %ld\t %d\t\n",
//	  outgoing.sender_id, outgoing.ack_number,_packets_sent, outgoing.sent_timestamp, _window); 
    }

    _next_transmission_time = Socket::timestamp() + _transmission_interval;
  }

  if ( _next_transmission_time < Socket::timestamp() ) {
    SatPayload outgoing;
    outgoing.sequence_number = _packets_sent;
    outgoing.ack_number = -1;
    outgoing.sent_timestamp = Socket::timestamp();
    outgoing.recv_timestamp = 0;
    outgoing.oneway_ns = 0;
    outgoing.sender_id = _send_id;

    _send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );
    printf("pkt sent: %d\n",_packets_sent);
    /*
    printf( "%s pid=%d DATA SENT senderid=%d seq=%d, send_time=%ld, recv_time=%ld\n",
    _name.c_str(), getpid(), outgoing.sender_id, outgoing.sequence_number, outgoing.sent_timestamp, outgoing.recv_timestamp ); */

    _packets_sent++;
    //fprintf( _data_log_file, "%d\t %d\t %d\t %ld\t %d\t\n",
//	  outgoing.sender_id, outgoing.ack_number,_packets_sent, outgoing.sent_timestamp, _window); 

    _next_transmission_time = Socket::timestamp() + _transmission_interval;
  }
}

void SaturateServo::tick_now( void )
{
    if ( _remote == UNKNOWN ) {
        printf("unknwn remote\n");
	    return;
    }

    SatPayload outgoing;
    outgoing.sequence_number = _packets_sent;
    outgoing.ack_number = -1;
    outgoing.sent_timestamp = Socket::timestamp();
    outgoing.recv_timestamp = 0;
    outgoing.oneway_ns = 0;
    outgoing.sender_id = _send_id;

    _send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );

    printf( "DATA SENT  seq=%d, send_time=%ld, recv_time=%ld window:%d\n", outgoing.sequence_number, outgoing.sent_timestamp, outgoing.recv_timestamp, _window ); 

    //_packets_sent++;

    //_next_transmission_time = Socket::timestamp() + _transmission_interval;
}

void SaturateServo::tick_time()
{
    uint64_t start_time, end_time;
    uint64_t begin_time;
    float time_passed_s;
    if ( _remote == UNKNOWN ) {
	printf("Remote is unknown!\n");
	return;
    }
    if((_nof_pkt > 0) && (_con_time_s > 0)){
        printf("Nof pkt and conection time cannot be set simulanteously!\n");
        return;
    }
    if((_nof_pkt == 0) && (_con_time_s == 0)){
        printf("nof_pkt and time are all zeros! Set nof_pkt to 30000\n");
        _nof_pkt = 30000;
    }
    printf("Inter-Pkt-Intval:%d Con-Time-S:%d Total-Pkt-ToBe_Sent:%d\n",_pkt_intval,_con_time_s,_nof_pkt);
    SatPayload outgoing;
    outgoing.ack_number = -1;
    outgoing.recv_timestamp = 0;
    outgoing.oneway_ns = 0;
    outgoing.sender_id = _send_id;
    outgoing.CON_CLOSE = false;
    if( _nof_pkt > 0){
        printf("Packet number based transmission!\n");
        for( int i = 0; i < (int)(_nof_pkt + 200); i++){
            outgoing.sequence_number = _packets_sent;
            start_time = Socket::timestamp();
            outgoing.sent_timestamp = start_time;
            _send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );
            //printf( "DATA SENT  seq=%d, send_time=%ld, recv_time=%ld window:%d\n", outgoing.sequence_number, outgoing.sent_timestamp, outgoing.recv_timestamp, _window ); 
            _packets_sent++;
            while(true){
             end_time = Socket::timestamp();
             if(end_time - start_time > (uint64_t) _pkt_intval * 1000)
                break;
            }
        }
    }else if(_con_time_s > 0){
        printf("Time based transmission!\n");
        begin_time = Socket::timestamp();
        while(true){
            outgoing.sequence_number = _packets_sent;
            start_time = Socket::timestamp();
            outgoing.sent_timestamp = start_time;
            time_passed_s = (start_time - begin_time) / 1.e9;
            if(time_passed_s > _con_time_s){
                printf("Time is up!\n"); 
                outgoing.CON_CLOSE = true;
                usleep(100000);
                _send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );
                break;
            }else{
                outgoing.sent_timestamp = start_time;
                _send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );
                //printf( "DATA SENT  seq=%d, send_time=%ld, recv_time=%ld window:%d\n", outgoing.sequence_number, outgoing.sent_timestamp, outgoing.recv_timestamp, _window ); 
                _packets_sent++;
                while(true){
                     end_time = Socket::timestamp();
                     if(end_time - start_time > (uint64_t) _pkt_intval * 1000)
                    break;
                }
            }
        }	
    }
    _next_transmission_time = Socket::timestamp() + _transmission_interval;
    return;
}
void SaturateServo::tick_time_noClose()
{
    uint64_t start_time, end_time;
    uint64_t begin_time;
    float time_passed_s;
    if ( _remote == UNKNOWN ) {
	printf("Remote is unknown!\n");
	return;
    }
    if((_nof_pkt > 0) && (_con_time_s > 0)){
	printf("Nof pkt and conection time cannot be set simulanteously!\n");
	return;
    }
    if((_nof_pkt == 0) && (_con_time_s == 0)){
	printf("nof_pkt and time are all zeros! Set nof_pkt to 30000\n");
	_nof_pkt = 30000;
    }
    printf("Inter-Pkt-Intval:%d Con-Time-S:%d Total-Pkt-ToBe_Sent:%d\n",_pkt_intval,_con_time_s,_nof_pkt);
    SatPayload outgoing;
    outgoing.ack_number = -1;
    outgoing.recv_timestamp = 0;
    outgoing.oneway_ns = 0;
    outgoing.sender_id = _send_id;
    outgoing.CON_CLOSE = false;
    if( _nof_pkt > 0){
	printf("Packet number based transmission!\n");
	for( int i = 0; i < (int)(_nof_pkt + 200); i++){
	    outgoing.sequence_number = _packets_sent;
	    start_time = Socket::timestamp();
	    outgoing.sent_timestamp = start_time;
	    _send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );
	    //printf( "DATA SENT  seq=%d, send_time=%ld, recv_time=%ld window:%d\n", outgoing.sequence_number, outgoing.sent_timestamp, outgoing.recv_timestamp, _window ); 
	    _packets_sent++;
	    while(true){
		 end_time = Socket::timestamp();
		 if(end_time - start_time > (uint64_t) _pkt_intval * 1000)
		    break;
	    }
	}
    }else if(_con_time_s > 0){
	printf("Time based transmission!\n");
	begin_time = Socket::timestamp();
	while(true){
	    outgoing.sequence_number = _packets_sent;
	    start_time = Socket::timestamp();
	    outgoing.sent_timestamp = start_time;
	    time_passed_s = (start_time - begin_time) / 1.e9;
	    if(time_passed_s > _con_time_s){
		printf("Time is up!\n"); 
		break;
	    }else{
		outgoing.sent_timestamp = start_time;
		_send.send( Socket::Packet( _remote, outgoing.str( 1400 ) ) );
		//printf( "DATA SENT  seq=%d, send_time=%ld, recv_time=%ld window:%d\n", outgoing.sequence_number, outgoing.sent_timestamp, outgoing.recv_timestamp, _window ); 
		_packets_sent++;
		while(true){
		     end_time = Socket::timestamp();
		     if(end_time - start_time > (uint64_t) _pkt_intval * 1000)
			break;
		}
	    }
	}	
    }
    _next_transmission_time = Socket::timestamp() + _transmission_interval;
    return;
}
void SaturateServo::set_con_time(int time){
    _con_time_s = time;
}

void SaturateServo::set_pkt_intval(int pkt_intval){
    _pkt_intval = pkt_intval;
}

void SaturateServo::reset_pkt_seq(void){
    _packets_sent = 0;
}

int SaturateServo::get_pkt_seq(void){
    return _packets_sent;
}
