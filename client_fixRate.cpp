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

#include <cstdlib>
#include <cstring>
#include <iostream>

#include "acker.hh"

extern struct lte_cc_buffer *ctl_ch_buf;
volatile int RNTI_ID_DONE = 0;
volatile int tti = 0;
bool go_exit = false;

int main(int argc, char *argv[]){
    int pkt_intval = 500;
    int con_time_s = 0;
    int nof_pkt = 30000;

    Socket client_socket;
    bool server;
    int sender_id = getpid();
    Socket::Address server_address( UNKNOWN );
    server = false;
    
    client_socket.bind( Socket::Address( "0.0.0.0", 9001 ) );
    server_address = Socket::Address( "18.220.165.22", 9001 );

    FILE* FD;
    FD = fopen("./data/client-ack-log","w+");
    fclose(FD);

    Acker acker(client_socket, client_socket, server_address, server, sender_id );

    int32_t SeqNo = -1;
    acker.set_pkt_intval(pkt_intval);
    acker.set_con_time(con_time_s);
    acker.set_nof_pkt(nof_pkt);
    acker.notify_config(false);
    acker.recv_noACK_noRF();

    close(client_socket.get_sock());
    return 1;
} 
