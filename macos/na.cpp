//
//  na.c
//  Runner
//
//  Created by Gracjan Ziemiański on 25/12/2023.
//
#include "na.hpp"
#include <stdint.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}
