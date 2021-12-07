cmake_minimum_required (VERSION 2.8)
add_executable(client client.cpp acker.cc payload.cc socket.cc)
add_executable(server server.cpp saturateservo.cc payload.cc socket.cc)
