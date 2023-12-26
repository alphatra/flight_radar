//
//  na.cpp
//  Runner
//
//  Created by Gracjan Ziemiański on 25/12/2023.
//

#include "na.hpp"
#include <stdint.h>
#include <iostream>
#include <string>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
const char* hello_world() {
    static std::string hw = "Hello World\n";
    return hw.c_str();
}
