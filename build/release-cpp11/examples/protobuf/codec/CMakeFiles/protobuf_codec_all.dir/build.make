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

# Utility rule file for protobuf_codec_all.

# Include the progress variables for this target.
include examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/progress.make

examples/protobuf/codec/CMakeFiles/protobuf_codec_all: bin/protobuf_codec_test
examples/protobuf/codec/CMakeFiles/protobuf_codec_all: bin/protobuf_dispatcher_lite_test
examples/protobuf/codec/CMakeFiles/protobuf_codec_all: bin/protobuf_dispatcher_test
examples/protobuf/codec/CMakeFiles/protobuf_codec_all: bin/protobuf_server
examples/protobuf/codec/CMakeFiles/protobuf_codec_all: bin/protobuf_client


protobuf_codec_all: examples/protobuf/codec/CMakeFiles/protobuf_codec_all
protobuf_codec_all: examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/build.make

.PHONY : protobuf_codec_all

# Rule to build all files generated by this target.
examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/build: protobuf_codec_all

.PHONY : examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/build

examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/clean:
	cd /home/ubuntu/bitrpc/third/build/release-cpp11/examples/protobuf/codec && $(CMAKE_COMMAND) -P CMakeFiles/protobuf_codec_all.dir/cmake_clean.cmake
.PHONY : examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/clean

examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/depend:
	cd /home/ubuntu/bitrpc/third/build/release-cpp11 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/bitrpc/third/muduo-master /home/ubuntu/bitrpc/third/muduo-master/examples/protobuf/codec /home/ubuntu/bitrpc/third/build/release-cpp11 /home/ubuntu/bitrpc/third/build/release-cpp11/examples/protobuf/codec /home/ubuntu/bitrpc/third/build/release-cpp11/examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/protobuf/codec/CMakeFiles/protobuf_codec_all.dir/depend

