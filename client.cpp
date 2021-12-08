#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <math.h>
#include <sys/time.h>
#include <sys/poll.h>
#include <sys/socket.h>
#include <unistd.h>
#include <assert.h>
#include <signal.h>
#include <pthread.h>
#include <semaphore.h>
#include <linux/if.h>
#include <sys/types.h>
#include <netdb.h>
#include <poll.h>

#include <cstdlib>
#include <cstring>
#include <iostream>

#include "acker.hh"

extern struct lte_cc_buffer *ctl_ch_buf;
volatile int RNTI_ID_DONE = 0;
volatile int tti = 0;
bool go_exit = false;

int main(int argc, char *argv[]){
    int pkt_intval_us = 500;
    int con_time_s = 0;
    int nof_pkt = 30000;

    Socket client_socket;
    bool server;
    int sender_id = getpid();

    char* serverIP; 
    int opt;
    while ((opt = getopt(argc, argv, "snpt")) != -1) {
        switch (opt) {
            case 's':
                serverIP = argv[optind];
                break;
            case 'n':
                nof_pkt = atoi(argv[optind]);
                break;
            case 't':
                con_time_s = atoi(argv[optind]);
                break;
            case 'p':
                pkt_intval_us = atoi(argv[optind]);
                break;
            default:
                fprintf(stderr, "Usage: %s [-s serverIP] [-p pktInterval_in_us] [-n pktNum] [-t testTime]\n", argv[0]);
                exit(EXIT_FAILURE);
                return 0;
        }
    }
    // bind the clent socket 
    client_socket.bind( Socket::Address( "0.0.0.0", 9001 ) );

    // setting up the server address
    Socket::Address server_address( UNKNOWN );
    server = false;

    if(serverIP){
        printf("ServerIP:%s\n",serverIP);
        server_address = Socket::Address( serverIP, 9001 );
    }

    Acker acker(client_socket, client_socket, server_address, server, sender_id );

    // set the testing parameter
    acker.set_pkt_intval(pkt_intval_us);
    acker.set_con_time(con_time_s);
    acker.set_nof_pkt(nof_pkt);

    // start receving packets
    //acker.notify_config(false);
    acker.recv_noACK();

    close(client_socket.get_sock());

    return 1;
}
