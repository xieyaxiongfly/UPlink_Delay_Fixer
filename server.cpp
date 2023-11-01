#include <assert.h>
#include <poll.h>
#include <string>
#include <sys/types.h>
#include <unistd.h>
#include <vector>

#include "acker.hh"
#include "saturateservo.hh"

#include "dci_sink_client.h"
#include "dci_sink_dci_recv.h"
#include "dci_sink_ring_buffer.h"
#include "dci_sink_sock.h"

using namespace std;

bool go_exit = false;
ngscope_dci_sink_CA_t dci_CA_buf;

int main(int argc, char *argv[]) {
  int opt;
  int port = 9001;
  char *remoteIP = NULL;

  while ((opt = getopt(argc, argv, "r")) != -1) {
    switch (opt) {
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

  // setting up the server
  server = true;
  server_socket.bind(Socket::Address("0.0.0.0", port));

  // setting up the remote address
  Socket::Address remote_data_address(UNKNOWN);
  Socket::Address remote_feedback_address(UNKNOWN);

  if (remoteIP != NULL) {
    remote_data_address = Socket::Address(remoteIP, port);
    remote_feedback_address = Socket::Address(remoteIP, port);
  }

  FILE *data_log_file;
  FILE *ack_log_file;

  char ack_log_file_name[50];
  char data_log_file_name[50];

  sprintf(ack_log_file_name, "./data/%s-ack-log", server ? "server" : "client");
  sprintf(data_log_file_name, "./data/%s-data-log",
          server ? "server" : "client");

  ack_log_file = fopen(ack_log_file_name, "w");
  data_log_file = fopen(data_log_file_name, "w");

  pthread_t dci_thd;
  pthread_create(&dci_thd, NULL, dci_sink_client_thread, NULL);
  pthread_join(dci_thd, NULL);

  SaturateServo saturatr("OUTGOING", ack_log_file, data_log_file, server_socket,
                         server_socket, remote_data_address, server, sender_id);
  saturatr.send();
}
