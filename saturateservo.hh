#ifndef SATURATESERVO_HH
#define SATURATESERVO_HH

#include <fstream>
#include "socket.hh"

class Acker;

class SaturateServo
{
private:
    const std::string _name;
    FILE* _ack_log_file;
    FILE* _data_log_file;

    const Socket _listen;
    const Socket _send;
    Socket::Address _remote;

    const bool _server;
    const int _send_id;

    Acker *_acker;

    uint64_t _next_transmission_time;

    static const int _transmission_interval = 1000 * 1000 * 1000;

    int _foreign_id;

    int _packets_sent, _max_ack_id;

    int _window_size;
    int _window;
    uint32_t _pkt_intval;
    uint32_t _con_time_s;
    uint32_t _nof_pkt;
    
    static const int LOWER_WINDOW = 20;
    static const int UPPER_WINDOW = 1500;

    static constexpr double LOWER_RTT = 0.09;
    static constexpr double UPPER_RTT = 0.75;

public:
  SaturateServo( const char * s_name,
                 FILE* ack_log_file,
                 FILE* data_log_file,
		 const Socket & s_listen,
		 const Socket & s_send,
		 const Socket::Address & s_remote,
		 const bool s_server,
		 const int s_send_id);

  void recv( void );
  bool recv_noACK( void );
  
  uint64_t wait_time( void ) const;

  void tick( void );
  void tick_now( void );
  void tick_time();
  void tick_time_w_file();
  void tick_time_noClose();

  void send();

  void set_con_time(int);
  void set_pkt_intval(int);
  int get_con_time(){
        return _con_time_s;
    }
  int get_pkt_intval(){
        return _pkt_intval;
    }


  void reset_pkt_seq(void);
  int get_pkt_seq(void);

  void set_acker( Acker * const s_acker ) { _acker = s_acker; }

  void set_remote( const Socket::Address & s_remote ) { _remote = s_remote; }
  void set_window_size(const int window_size) {_window_size = window_size;}

  SaturateServo( const SaturateServo & ) = delete;
  const SaturateServo & operator=( const SaturateServo & ) = delete;
};

#endif
