#include "HTTPRequest.hpp"
#include <string>
#include <exception>
#include <cstdio>  // Dla printf

extern "C" __attribute__((visibility("default"))) __attribute__((used))
const char* fetchFlights() {
    try {
        http::Request request{"http://192.168.100.4:8080/flights"};
        const auto response = request.send("GET");
        char* cstr = new char[response.body.size() + 1];
        std::strcpy(cstr, std::string(response.body.begin(), response.body.end()).c_str());
        return cstr;
    } catch (const std::exception& e) {
        printf("Request failed, error: %s\n", e.what());
        return nullptr;
    }
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
const char* fetchFlightsFromCity(const char* cityName) {
    try {
        // Tworzenie URL na podstawie nazwy miasta
        std::string url = "http://172.20.10.2:8080/flights/fromCity/" + std::string(cityName);

        // Wykonanie zapytania HTTP GET
        http::Request request{url};
        const auto response = request.send("GET");

        // Konwersja odpowiedzi na cstring
        char* cstr = new char[response.body.size() + 1];
        std::strcpy(cstr, std::string(response.body.begin(), response.body.end()).c_str());
        return cstr;

    } catch (const std::exception& e) {
        printf("Request failed, error: %s\n", e.what());
        return nullptr;
    }
}