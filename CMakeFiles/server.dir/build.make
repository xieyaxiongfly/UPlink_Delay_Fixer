# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/paws/FixRateDelayMeter

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/paws/FixRateDelayMeter

# Include any dependencies generated for this target.
include CMakeFiles/server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/server.dir/flags.make

CMakeFiles/server.dir/server.cpp.o: CMakeFiles/server.dir/flags.make
CMakeFiles/server.dir/server.cpp.o: server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/paws/FixRateDelayMeter/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/server.dir/server.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server.dir/server.cpp.o -c /home/paws/FixRateDelayMeter/server.cpp

CMakeFiles/server.dir/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/server.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/paws/FixRateDelayMeter/server.cpp > CMakeFiles/server.dir/server.cpp.i

CMakeFiles/server.dir/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/server.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/paws/FixRateDelayMeter/server.cpp -o CMakeFiles/server.dir/server.cpp.s

CMakeFiles/server.dir/server.cpp.o.requires:

.PHONY : CMakeFiles/server.dir/server.cpp.o.requires

CMakeFiles/server.dir/server.cpp.o.provides: CMakeFiles/server.dir/server.cpp.o.requires
	$(MAKE) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/server.cpp.o.provides.build
.PHONY : CMakeFiles/server.dir/server.cpp.o.provides

CMakeFiles/server.dir/server.cpp.o.provides.build: CMakeFiles/server.dir/server.cpp.o


CMakeFiles/server.dir/saturateservo.cc.o: CMakeFiles/server.dir/flags.make
CMakeFiles/server.dir/saturateservo.cc.o: saturateservo.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/paws/FixRateDelayMeter/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/server.dir/saturateservo.cc.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server.dir/saturateservo.cc.o -c /home/paws/FixRateDelayMeter/saturateservo.cc

CMakeFiles/server.dir/saturateservo.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/saturateservo.cc.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/paws/FixRateDelayMeter/saturateservo.cc > CMakeFiles/server.dir/saturateservo.cc.i

CMakeFiles/server.dir/saturateservo.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/saturateservo.cc.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/paws/FixRateDelayMeter/saturateservo.cc -o CMakeFiles/server.dir/saturateservo.cc.s

CMakeFiles/server.dir/saturateservo.cc.o.requires:

.PHONY : CMakeFiles/server.dir/saturateservo.cc.o.requires

CMakeFiles/server.dir/saturateservo.cc.o.provides: CMakeFiles/server.dir/saturateservo.cc.o.requires
	$(MAKE) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/saturateservo.cc.o.provides.build
.PHONY : CMakeFiles/server.dir/saturateservo.cc.o.provides

CMakeFiles/server.dir/saturateservo.cc.o.provides.build: CMakeFiles/server.dir/saturateservo.cc.o


CMakeFiles/server.dir/payload.cc.o: CMakeFiles/server.dir/flags.make
CMakeFiles/server.dir/payload.cc.o: payload.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/paws/FixRateDelayMeter/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/server.dir/payload.cc.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server.dir/payload.cc.o -c /home/paws/FixRateDelayMeter/payload.cc

CMakeFiles/server.dir/payload.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/payload.cc.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/paws/FixRateDelayMeter/payload.cc > CMakeFiles/server.dir/payload.cc.i

CMakeFiles/server.dir/payload.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/payload.cc.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/paws/FixRateDelayMeter/payload.cc -o CMakeFiles/server.dir/payload.cc.s

CMakeFiles/server.dir/payload.cc.o.requires:

.PHONY : CMakeFiles/server.dir/payload.cc.o.requires

CMakeFiles/server.dir/payload.cc.o.provides: CMakeFiles/server.dir/payload.cc.o.requires
	$(MAKE) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/payload.cc.o.provides.build
.PHONY : CMakeFiles/server.dir/payload.cc.o.provides

CMakeFiles/server.dir/payload.cc.o.provides.build: CMakeFiles/server.dir/payload.cc.o


CMakeFiles/server.dir/socket.cc.o: CMakeFiles/server.dir/flags.make
CMakeFiles/server.dir/socket.cc.o: socket.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/paws/FixRateDelayMeter/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/server.dir/socket.cc.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server.dir/socket.cc.o -c /home/paws/FixRateDelayMeter/socket.cc

CMakeFiles/server.dir/socket.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/socket.cc.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/paws/FixRateDelayMeter/socket.cc > CMakeFiles/server.dir/socket.cc.i

CMakeFiles/server.dir/socket.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/socket.cc.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/paws/FixRateDelayMeter/socket.cc -o CMakeFiles/server.dir/socket.cc.s

CMakeFiles/server.dir/socket.cc.o.requires:

.PHONY : CMakeFiles/server.dir/socket.cc.o.requires

CMakeFiles/server.dir/socket.cc.o.provides: CMakeFiles/server.dir/socket.cc.o.requires
	$(MAKE) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/socket.cc.o.provides.build
.PHONY : CMakeFiles/server.dir/socket.cc.o.provides

CMakeFiles/server.dir/socket.cc.o.provides.build: CMakeFiles/server.dir/socket.cc.o


# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/server.cpp.o" \
"CMakeFiles/server.dir/saturateservo.cc.o" \
"CMakeFiles/server.dir/payload.cc.o" \
"CMakeFiles/server.dir/socket.cc.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

server: CMakeFiles/server.dir/server.cpp.o
server: CMakeFiles/server.dir/saturateservo.cc.o
server: CMakeFiles/server.dir/payload.cc.o
server: CMakeFiles/server.dir/socket.cc.o
server: CMakeFiles/server.dir/build.make
server: CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/paws/FixRateDelayMeter/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/server.dir/build: server

.PHONY : CMakeFiles/server.dir/build

CMakeFiles/server.dir/requires: CMakeFiles/server.dir/server.cpp.o.requires
CMakeFiles/server.dir/requires: CMakeFiles/server.dir/saturateservo.cc.o.requires
CMakeFiles/server.dir/requires: CMakeFiles/server.dir/payload.cc.o.requires
CMakeFiles/server.dir/requires: CMakeFiles/server.dir/socket.cc.o.requires

.PHONY : CMakeFiles/server.dir/requires

CMakeFiles/server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/server.dir/clean

CMakeFiles/server.dir/depend:
	cd /home/paws/FixRateDelayMeter && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/paws/FixRateDelayMeter /home/paws/FixRateDelayMeter /home/paws/FixRateDelayMeter /home/paws/FixRateDelayMeter /home/paws/FixRateDelayMeter/CMakeFiles/server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/server.dir/depend

