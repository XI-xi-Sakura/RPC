# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/ubuntu/bitrpc/third/muduo-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/bitrpc/third/build/release-cpp11

# Include any dependencies generated for this target.
include examples/roundtrip/CMakeFiles/roundtrip.dir/depend.make

# Include the progress variables for this target.
include examples/roundtrip/CMakeFiles/roundtrip.dir/progress.make

# Include the compile flags for this target's objects.
include examples/roundtrip/CMakeFiles/roundtrip.dir/flags.make

examples/roundtrip/CMakeFiles/roundtrip.dir/roundtrip.cc.o: examples/roundtrip/CMakeFiles/roundtrip.dir/flags.make
examples/roundtrip/CMakeFiles/roundtrip.dir/roundtrip.cc.o: /home/ubuntu/bitrpc/third/muduo-master/examples/roundtrip/roundtrip.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/bitrpc/third/build/release-cpp11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/roundtrip/CMakeFiles/roundtrip.dir/roundtrip.cc.o"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/examples/roundtrip && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/roundtrip.dir/roundtrip.cc.o -c /home/ubuntu/bitrpc/third/muduo-master/examples/roundtrip/roundtrip.cc

examples/roundtrip/CMakeFiles/roundtrip.dir/roundtrip.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/roundtrip.dir/roundtrip.cc.i"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/examples/roundtrip && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/bitrpc/third/muduo-master/examples/roundtrip/roundtrip.cc > CMakeFiles/roundtrip.dir/roundtrip.cc.i

examples/roundtrip/CMakeFiles/roundtrip.dir/roundtrip.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/roundtrip.dir/roundtrip.cc.s"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/examples/roundtrip && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/bitrpc/third/muduo-master/examples/roundtrip/roundtrip.cc -o CMakeFiles/roundtrip.dir/roundtrip.cc.s

# Object files for target roundtrip
roundtrip_OBJECTS = \
"CMakeFiles/roundtrip.dir/roundtrip.cc.o"

# External object files for target roundtrip
roundtrip_EXTERNAL_OBJECTS =

bin/roundtrip: examples/roundtrip/CMakeFiles/roundtrip.dir/roundtrip.cc.o
bin/roundtrip: examples/roundtrip/CMakeFiles/roundtrip.dir/build.make
bin/roundtrip: lib/libmuduo_net.a
bin/roundtrip: lib/libmuduo_base.a
bin/roundtrip: examples/roundtrip/CMakeFiles/roundtrip.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/bitrpc/third/build/release-cpp11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/roundtrip"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/examples/roundtrip && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/roundtrip.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/roundtrip/CMakeFiles/roundtrip.dir/build: bin/roundtrip

.PHONY : examples/roundtrip/CMakeFiles/roundtrip.dir/build

examples/roundtrip/CMakeFiles/roundtrip.dir/clean:
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/examples/roundtrip && $(CMAKE_COMMAND) -P CMakeFiles/roundtrip.dir/cmake_clean.cmake
.PHONY : examples/roundtrip/CMakeFiles/roundtrip.dir/clean

examples/roundtrip/CMakeFiles/roundtrip.dir/depend:
	cd /home/ubuntu/bitrpc/third/build/release-cpp11 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/bitrpc/third/muduo-master /home/ubuntu/bitrpc/third/muduo-master/examples/roundtrip /home/ubuntu/bitrpc/third/build/release-cpp11 /home/ubuntu/bitrpc/third/build/release-cpp11/examples/roundtrip /home/ubuntu/bitrpc/third/build/release-cpp11/examples/roundtrip/CMakeFiles/roundtrip.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/roundtrip/CMakeFiles/roundtrip.dir/depend

