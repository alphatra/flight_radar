# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/print_value.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/print_value.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/print_value.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/print_value.dir/flags.make

tests/CMakeFiles/print_value.dir/print_value.c.o: tests/CMakeFiles/print_value.dir/flags.make
tests/CMakeFiles/print_value.dir/print_value.c.o: /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/tests/print_value.c
tests/CMakeFiles/print_value.dir/print_value.c.o: tests/CMakeFiles/print_value.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/print_value.dir/print_value.c.o"
	cd /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tests/CMakeFiles/print_value.dir/print_value.c.o -MF CMakeFiles/print_value.dir/print_value.c.o.d -o CMakeFiles/print_value.dir/print_value.c.o -c /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/tests/print_value.c

tests/CMakeFiles/print_value.dir/print_value.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/print_value.dir/print_value.c.i"
	cd /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/tests/print_value.c > CMakeFiles/print_value.dir/print_value.c.i

tests/CMakeFiles/print_value.dir/print_value.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/print_value.dir/print_value.c.s"
	cd /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/tests/print_value.c -o CMakeFiles/print_value.dir/print_value.c.s

# Object files for target print_value
print_value_OBJECTS = \
"CMakeFiles/print_value.dir/print_value.c.o"

# External object files for target print_value
print_value_EXTERNAL_OBJECTS =

tests/print_value: tests/CMakeFiles/print_value.dir/print_value.c.o
tests/print_value: tests/CMakeFiles/print_value.dir/build.make
tests/print_value: libcjson.1.7.17.dylib
tests/print_value: tests/libunity.a
tests/print_value: tests/CMakeFiles/print_value.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable print_value"
	cd /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/print_value.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/print_value.dir/build: tests/print_value
.PHONY : tests/CMakeFiles/print_value.dir/build

tests/CMakeFiles/print_value.dir/clean:
	cd /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/print_value.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/print_value.dir/clean

tests/CMakeFiles/print_value.dir/depend:
	cd /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/tests /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/tests /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/tests/CMakeFiles/print_value.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/print_value.dir/depend

