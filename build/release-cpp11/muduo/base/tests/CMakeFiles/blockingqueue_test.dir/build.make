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
include muduo/base/tests/CMakeFiles/blockingqueue_test.dir/depend.make

# Include the progress variables for this target.
include muduo/base/tests/CMakeFiles/blockingqueue_test.dir/progress.make

# Include the compile flags for this target's objects.
include muduo/base/tests/CMakeFiles/blockingqueue_test.dir/flags.make

muduo/base/tests/CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.o: muduo/base/tests/CMakeFiles/blockingqueue_test.dir/flags.make
muduo/base/tests/CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.o: /home/ubuntu/bitrpc/third/muduo-master/muduo/base/tests/BlockingQueue_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/bitrpc/third/build/release-cpp11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object muduo/base/tests/CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.o"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/muduo/base/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.o -c /home/ubuntu/bitrpc/third/muduo-master/muduo/base/tests/BlockingQueue_test.cc

muduo/base/tests/CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.i"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/muduo/base/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/bitrpc/third/muduo-master/muduo/base/tests/BlockingQueue_test.cc > CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.i

muduo/base/tests/CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.s"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/muduo/base/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/bitrpc/third/muduo-master/muduo/base/tests/BlockingQueue_test.cc -o CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.s

# Object files for target blockingqueue_test
blockingqueue_test_OBJECTS = \
"CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.o"

# External object files for target blockingqueue_test
blockingqueue_test_EXTERNAL_OBJECTS =

bin/blockingqueue_test: muduo/base/tests/CMakeFiles/blockingqueue_test.dir/BlockingQueue_test.cc.o
bin/blockingqueue_test: muduo/base/tests/CMakeFiles/blockingqueue_test.dir/build.make
bin/blockingqueue_test: lib/libmuduo_base.a
bin/blockingqueue_test: muduo/base/tests/CMakeFiles/blockingqueue_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/bitrpc/third/build/release-cpp11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/blockingqueue_test"
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/muduo/base/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/blockingqueue_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
muduo/base/tests/CMakeFiles/blockingqueue_test.dir/build: bin/blockingqueue_test

.PHONY : muduo/base/tests/CMakeFiles/blockingqueue_test.dir/build

muduo/base/tests/CMakeFiles/blockingqueue_test.dir/clean:
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/muduo/base/tests && $(CMAKE_COMMAND) -P CMakeFiles/blockingqueue_test.dir/cmake_clean.cmake
.PHONY : muduo/base/tests/CMakeFiles/blockingqueue_test.dir/clean

muduo/base/tests/CMakeFiles/blockingqueue_test.dir/depend:
	cd /home/ubuntu/bitrpc/third/build/release-cpp11 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/bitrpc/third/muduo-master /home/ubuntu/bitrpc/third/muduo-master/muduo/base/tests /home/ubuntu/bitrpc/third/build/release-cpp11 /home/ubuntu/bitrpc/third/build/release-cpp11/muduo/base/tests /home/ubuntu/bitrpc/third/build/release-cpp11/muduo/base/tests/CMakeFiles/blockingqueue_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : muduo/base/tests/CMakeFiles/blockingqueue_test.dir/depend

