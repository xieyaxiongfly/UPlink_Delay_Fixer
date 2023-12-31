# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yaxiong/research/UPlink_Delay_Fixer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yaxiong/research/UPlink_Delay_Fixer

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/yaxiong/research/UPlink_Delay_Fixer/CMakeFiles /home/yaxiong/research/UPlink_Delay_Fixer//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/yaxiong/research/UPlink_Delay_Fixer/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named client

# Build rule for target.
client: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 client
.PHONY : client

# fast build rule for target.
client/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/build
.PHONY : client/fast

#=============================================================================
# Target rules for targets named server

# Build rule for target.
server: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 server
.PHONY : server

# fast build rule for target.
server/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/build
.PHONY : server/fast

acker.o: acker.cc.o
.PHONY : acker.o

# target to build an object file
acker.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/acker.cc.o
.PHONY : acker.cc.o

acker.i: acker.cc.i
.PHONY : acker.i

# target to preprocess a source file
acker.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/acker.cc.i
.PHONY : acker.cc.i

acker.s: acker.cc.s
.PHONY : acker.s

# target to generate assembly for a file
acker.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/acker.cc.s
.PHONY : acker.cc.s

client.o: client.cpp.o
.PHONY : client.o

# target to build an object file
client.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/client.cpp.o
.PHONY : client.cpp.o

client.i: client.cpp.i
.PHONY : client.i

# target to preprocess a source file
client.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/client.cpp.i
.PHONY : client.cpp.i

client.s: client.cpp.s
.PHONY : client.s

# target to generate assembly for a file
client.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/client.cpp.s
.PHONY : client.cpp.s

dci_sink_client.o: dci_sink_client.c.o
.PHONY : dci_sink_client.o

# target to build an object file
dci_sink_client.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_client.c.o
.PHONY : dci_sink_client.c.o

dci_sink_client.i: dci_sink_client.c.i
.PHONY : dci_sink_client.i

# target to preprocess a source file
dci_sink_client.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_client.c.i
.PHONY : dci_sink_client.c.i

dci_sink_client.s: dci_sink_client.c.s
.PHONY : dci_sink_client.s

# target to generate assembly for a file
dci_sink_client.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_client.c.s
.PHONY : dci_sink_client.c.s

dci_sink_recv_dci.o: dci_sink_recv_dci.c.o
.PHONY : dci_sink_recv_dci.o

# target to build an object file
dci_sink_recv_dci.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_recv_dci.c.o
.PHONY : dci_sink_recv_dci.c.o

dci_sink_recv_dci.i: dci_sink_recv_dci.c.i
.PHONY : dci_sink_recv_dci.i

# target to preprocess a source file
dci_sink_recv_dci.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_recv_dci.c.i
.PHONY : dci_sink_recv_dci.c.i

dci_sink_recv_dci.s: dci_sink_recv_dci.c.s
.PHONY : dci_sink_recv_dci.s

# target to generate assembly for a file
dci_sink_recv_dci.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_recv_dci.c.s
.PHONY : dci_sink_recv_dci.c.s

dci_sink_ring_buffer.o: dci_sink_ring_buffer.c.o
.PHONY : dci_sink_ring_buffer.o

# target to build an object file
dci_sink_ring_buffer.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_ring_buffer.c.o
.PHONY : dci_sink_ring_buffer.c.o

dci_sink_ring_buffer.i: dci_sink_ring_buffer.c.i
.PHONY : dci_sink_ring_buffer.i

# target to preprocess a source file
dci_sink_ring_buffer.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_ring_buffer.c.i
.PHONY : dci_sink_ring_buffer.c.i

dci_sink_ring_buffer.s: dci_sink_ring_buffer.c.s
.PHONY : dci_sink_ring_buffer.s

# target to generate assembly for a file
dci_sink_ring_buffer.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_ring_buffer.c.s
.PHONY : dci_sink_ring_buffer.c.s

dci_sink_sock.o: dci_sink_sock.c.o
.PHONY : dci_sink_sock.o

# target to build an object file
dci_sink_sock.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_sock.c.o
.PHONY : dci_sink_sock.c.o

dci_sink_sock.i: dci_sink_sock.c.i
.PHONY : dci_sink_sock.i

# target to preprocess a source file
dci_sink_sock.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_sock.c.i
.PHONY : dci_sink_sock.c.i

dci_sink_sock.s: dci_sink_sock.c.s
.PHONY : dci_sink_sock.s

# target to generate assembly for a file
dci_sink_sock.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/dci_sink_sock.c.s
.PHONY : dci_sink_sock.c.s

payload.o: payload.cc.o
.PHONY : payload.o

# target to build an object file
payload.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/payload.cc.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/payload.cc.o
.PHONY : payload.cc.o

payload.i: payload.cc.i
.PHONY : payload.i

# target to preprocess a source file
payload.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/payload.cc.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/payload.cc.i
.PHONY : payload.cc.i

payload.s: payload.cc.s
.PHONY : payload.s

# target to generate assembly for a file
payload.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/payload.cc.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/payload.cc.s
.PHONY : payload.cc.s

saturateservo.o: saturateservo.cc.o
.PHONY : saturateservo.o

# target to build an object file
saturateservo.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/saturateservo.cc.o
.PHONY : saturateservo.cc.o

saturateservo.i: saturateservo.cc.i
.PHONY : saturateservo.i

# target to preprocess a source file
saturateservo.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/saturateservo.cc.i
.PHONY : saturateservo.cc.i

saturateservo.s: saturateservo.cc.s
.PHONY : saturateservo.s

# target to generate assembly for a file
saturateservo.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/saturateservo.cc.s
.PHONY : saturateservo.cc.s

server.o: server.cpp.o
.PHONY : server.o

# target to build an object file
server.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/server.cpp.o
.PHONY : server.cpp.o

server.i: server.cpp.i
.PHONY : server.i

# target to preprocess a source file
server.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/server.cpp.i
.PHONY : server.cpp.i

server.s: server.cpp.s
.PHONY : server.s

# target to generate assembly for a file
server.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/server.cpp.s
.PHONY : server.cpp.s

socket.o: socket.cc.o
.PHONY : socket.o

# target to build an object file
socket.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/socket.cc.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/socket.cc.o
.PHONY : socket.cc.o

socket.i: socket.cc.i
.PHONY : socket.i

# target to preprocess a source file
socket.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/socket.cc.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/socket.cc.i
.PHONY : socket.cc.i

socket.s: socket.cc.s
.PHONY : socket.s

# target to generate assembly for a file
socket.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/socket.cc.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/socket.cc.s
.PHONY : socket.cc.s

util.o: util.c.o
.PHONY : util.o

# target to build an object file
util.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/util.c.o
.PHONY : util.c.o

util.i: util.c.i
.PHONY : util.i

# target to preprocess a source file
util.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/util.c.i
.PHONY : util.c.i

util.s: util.c.s
.PHONY : util.s

# target to generate assembly for a file
util.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/util.c.s
.PHONY : util.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... client"
	@echo "... server"
	@echo "... acker.o"
	@echo "... acker.i"
	@echo "... acker.s"
	@echo "... client.o"
	@echo "... client.i"
	@echo "... client.s"
	@echo "... dci_sink_client.o"
	@echo "... dci_sink_client.i"
	@echo "... dci_sink_client.s"
	@echo "... dci_sink_recv_dci.o"
	@echo "... dci_sink_recv_dci.i"
	@echo "... dci_sink_recv_dci.s"
	@echo "... dci_sink_ring_buffer.o"
	@echo "... dci_sink_ring_buffer.i"
	@echo "... dci_sink_ring_buffer.s"
	@echo "... dci_sink_sock.o"
	@echo "... dci_sink_sock.i"
	@echo "... dci_sink_sock.s"
	@echo "... payload.o"
	@echo "... payload.i"
	@echo "... payload.s"
	@echo "... saturateservo.o"
	@echo "... saturateservo.i"
	@echo "... saturateservo.s"
	@echo "... server.o"
	@echo "... server.i"
	@echo "... server.s"
	@echo "... socket.o"
	@echo "... socket.i"
	@echo "... socket.s"
	@echo "... util.o"
	@echo "... util.i"
	@echo "... util.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

