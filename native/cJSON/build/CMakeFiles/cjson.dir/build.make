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
include CMakeFiles/cjson.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/cjson.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/cjson.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cjson.dir/flags.make

CMakeFiles/cjson.dir/cJSON.c.o: CMakeFiles/cjson.dir/flags.make
CMakeFiles/cjson.dir/cJSON.c.o: /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/cJSON.c
CMakeFiles/cjson.dir/cJSON.c.o: CMakeFiles/cjson.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/cjson.dir/cJSON.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cjson.dir/cJSON.c.o -MF CMakeFiles/cjson.dir/cJSON.c.o.d -o CMakeFiles/cjson.dir/cJSON.c.o -c /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/cJSON.c

CMakeFiles/cjson.dir/cJSON.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cjson.dir/cJSON.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/cJSON.c > CMakeFiles/cjson.dir/cJSON.c.i

CMakeFiles/cjson.dir/cJSON.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cjson.dir/cJSON.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/cJSON.c -o CMakeFiles/cjson.dir/cJSON.c.s

# Object files for target cjson
cjson_OBJECTS = \
"CMakeFiles/cjson.dir/cJSON.c.o"

# External object files for target cjson
cjson_EXTERNAL_OBJECTS =

libcjson.1.7.17.dylib: CMakeFiles/cjson.dir/cJSON.c.o
libcjson.1.7.17.dylib: CMakeFiles/cjson.dir/build.make
libcjson.1.7.17.dylib: CMakeFiles/cjson.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libcjson.dylib"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cjson.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library libcjson.1.7.17.dylib libcjson.1.dylib libcjson.dylib

libcjson.1.dylib: libcjson.1.7.17.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate libcjson.1.dylib

libcjson.dylib: libcjson.1.7.17.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate libcjson.dylib

# Rule to build all files generated by this target.
CMakeFiles/cjson.dir/build: libcjson.dylib
.PHONY : CMakeFiles/cjson.dir/build

CMakeFiles/cjson.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cjson.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cjson.dir/clean

CMakeFiles/cjson.dir/depend:
	cd /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/CMakeFiles/cjson.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/cjson.dir/depend

