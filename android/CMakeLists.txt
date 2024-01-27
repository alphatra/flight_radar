project(FlightRadar)
cmake_minimum_required(VERSION 3.4.1)

# Sprawdza platformę
if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
    # Dodaje bibliotekę dla iOS
    add_library(ne SHARED ../ios/na.cpp)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Android")
    # Dodaje bibliotekę dla Androida
    add_library(ne SHARED cpp/na.cpp)
endif()
