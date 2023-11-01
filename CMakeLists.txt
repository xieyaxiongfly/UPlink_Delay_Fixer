
cmake_minimum_required (VERSION 3.8)
set (CMAKE_CXX_STANDARD 11)

add_executable(client client.cpp acker.cc payload.cc socket.cc)
add_executable(server server.cpp saturateservo.cc payload.cc socket.cc dci_sink_client.c dci_sink_recv_dci.c dci_sink_ring_buffer.c dci_sink_sock.c util.c)

target_link_libraries(server pthread)

