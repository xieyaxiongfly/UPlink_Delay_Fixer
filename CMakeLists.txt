cmake_minimum_required (VERSION 2.8)
add_executable(client client_fixRate.cpp acker.cc payload.cc socket.cc)
add_executable(server serverFixTime.cc saturateservo.cc payload.cc socket.cc)
