# CMake generated Testfile for 
# Source directory: /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON
# Build directory: /Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(cJSON_test "/Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/build/cJSON_test")
set_tests_properties(cJSON_test PROPERTIES  _BACKTRACE_TRIPLES "/Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/CMakeLists.txt;252;add_test;/Users/gracjanziemianski/Desktop/Projekty/flight_Radar/native/cJSON/CMakeLists.txt;0;")
subdirs("tests")
subdirs("fuzzing")
