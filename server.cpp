#include <string>
#include <vector>
#include <poll.h>
#include <assert.h>
#include <sys/types.h>
#include <unistd.h>

#include "acker.hh"
#include "saturateservo.hh"

using namespace std;

int main( int argc, char *argv[] )
{
    int opt;
    int port = 9001; 
    char* remoteIP = NULL;

    while((opt = getopt(argc, argv, "r")) != -1){
        switch (opt){
            case 'r':
                remoteIP = argv[optind];
                break;
            default:
                return 0;
        }
    }

    Socket server_socket;
    bool server;
    int sender_id = getpid();

    //setting up the server
    server = true;
    server_socket.bind( Socket::Address( "0.0.0.0", port ) );

    // setting up the remote address
    Socket::Address remote_data_address(UNKNOWN);
    Socket::Address remote_feedback_address(UNKNOWN);
    
     
    if(remoteIP != NULL){
        remote_data_address = Socket::Address(remoteIP, port);
        remote_feedback_address = Socket::Address(remoteIP, port);
    }

    FILE* data_log_file;
    FILE* ack_log_file;

    char ack_log_file_name[50];
    char data_log_file_name[50];

    sprintf(ack_log_file_name,"./data/%s-ack-log",server ? "server" : "client");
    sprintf(data_log_file_name,"./data/%s-data-log",server ? "server" : "client");

    ack_log_file=fopen(ack_log_file_name,"w");
    data_log_file=fopen(data_log_file_name,"w");

    SaturateServo saturatr( "OUTGOING", ack_log_file, data_log_file, server_socket, server_socket, remote_data_address, server, sender_id);
    saturatr.send();

 //   while ( 1 ) {
 //       fflush( NULL );
 //       /* wait for incoming packet OR expiry of timer */
 //       struct pollfd poll_fds[ 1 ];
 //       poll_fds[ 0 ].fd = server_socket.get_sock();
 //       poll_fds[ 0 ].events = POLLIN;

 //       struct timespec timeout;
 //       timeout.tv_sec = 0;
 //       timeout.tv_nsec = 50000000;

 //       ppoll( poll_fds, 1, &timeout, NULL );

 //       if ( poll_fds[ 0 ].revents & POLLIN ) {
 //           if(saturatr.recv_noACK()){
 //               printf("END of SEND pkt \n");
 //               break;
 //           }else{
 //               if(saturatr.get_pkt_intval() < 0 && saturatr.get_con_time() < 0){
 //                   printf("Tick now\n");
 //                   saturatr.tick_now();
 //               }else{
 //                   printf("Tick time\n");
 //                   saturatr.tick_time();
 //                   saturatr.reset_pkt_seq();
 //               }
 //           }
 //       }else{
 //           printf("Tick now\n");
 //           saturatr.tick_now();
 //       }

 //   }
}
