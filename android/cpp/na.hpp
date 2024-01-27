//
//  na.hpp
//  Runner
//
//  Created by Gracjan Ziemiański on 25/12/2023.
//

#ifndef na_hpp
#define na_hpp

#include <string>

extern "C" __attribute__((visibility("default"))) __attribute__((used)) {
// Deklaracja funkcji fetchFlights
const char* fetchFlights();

// Deklaracja funkcji fetchFlightsFromCity
const char* fetchFlightsFromCity(const char* cityName);
}

#endif /* na_hpp */
