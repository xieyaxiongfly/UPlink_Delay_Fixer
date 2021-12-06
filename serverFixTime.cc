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
    while((opt = getopt(argc, argv, "p")) != -1){
        switch (opt){
        case 'p':
            port = atoi(argv[optind]);
	    printf("Listen on Port: %d\n",port);
	    break;
        default:
            printf("Usage: serverFixTime\n");
            return 0;
        }
    }

    Socket server_socket;
    bool server;

    int sender_id = getpid();

    Socket::Address remote_data_address( "18.220.165.22",  9001 );
    Socket::Address remote_feedback_address(  "18.220.165.22",  9001 );

    server = true;
    server_socket.bind( Socket::Address( "0.0.0.0", port ) );

    FILE* data_log_file;
    FILE* ack_log_file;

    char ack_log_file_name[50];
    char data_log_file_name[50];
    sprintf(ack_log_file_name,"./data/%s-ack-log",server ? "server" : "client");
    sprintf(data_log_file_name,"./data/%s-data-log",server ? "server" : "client");
    ack_log_file=fopen(ack_log_file_name,"w");
    data_log_file=fopen(data_log_file_name,"w");

    SaturateServo saturatr( "OUTGOING", ack_log_file, data_log_file, server_socket, server_socket, remote_data_address, server, sender_id);

    while ( 1 ) {
        fflush( NULL );
        /* wait for incoming packet OR expiry of timer */
        struct pollfd poll_fds[ 1 ];
        poll_fds[ 0 ].fd = server_socket.get_sock();
        poll_fds[ 0 ].events = POLLIN;

        struct timespec timeout;
        timeout.tv_sec = 0;
        timeout.tv_nsec = 50000000;

        ppoll( poll_fds, 1, &timeout, NULL );

        if ( poll_fds[ 0 ].revents & POLLIN ) {
            if(saturatr.recv_noACK()){
                printf("END of SEND pkt \n");
                break;
            }else{
                if(saturatr.get_pkt_intval() < 0 && saturatr.get_con_time() < 0){
                    printf("Tick now\n");
                    saturatr.tick_now();
                }else{
                    printf("Tick time\n");
                    saturatr.tick_time();
                    saturatr.reset_pkt_seq();
                }
            }
        }else{
            printf("Tick now\n");
            saturatr.tick_now();
        }

    }
}
