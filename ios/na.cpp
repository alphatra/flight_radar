#include "HTTPRequest.hpp"
#include <string>
#include <exception>
#include <cstdio>
#include "httplib.h"
#include "json.hpp"

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
        std::string url = "http://192.168.100.4:8080/flights/fromCity/" + std::string(cityName);

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

extern "C" __attribute__((visibility("default"))) __attribute__((used))
const char* fetchFlightsFromTo(const char* fromCity, const char* toCity) {
    try {
        std::string url = "http://192.168.100.4:8080/flights/fromTo/";
        url += std::string(fromCity) + "/" + std::string(toCity);

        http::Request request{url};
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
const char* fetchFlightsFromToWithDateRange(const char* originCity, const char* destinationCity, const char* startDate, const char* endDate) {
    try {
        std::string url = "http://192.168.100.4:8080/flights/fromToWithDateRange/";
        url += std::string(originCity) + "/" + std::string(destinationCity) + "/";
        url += std::string(startDate) + "/" + std::string(endDate) + "/0"; // Default value for numberOfSeats is 0

        http::Request request{url};
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
extern "C" const char* createBooking(int flightId, const char* seatNumber, const char* passengerName) {
    try {
        httplib::Client cli("http://192.168.100.4:8080");

        nlohmann::json bookingData;
        bookingData["flightId"] = flightId;
        bookingData["seatNumber"] = seatNumber;
        bookingData["passengerName"] = passengerName;

        auto res = cli.Post("/createBooking/", bookingData.dump(), "application/json");

        if (res && res->status == 200) {
            char* cstr = new char[res->body.size() + 1];
            std::strcpy(cstr, res->body.c_str());
            return cstr;
        } else {
            // Handle error or null response
                printf("Booking request failed, status: %d\n", res->status);
            return nullptr;
        }

    } catch (const std::exception& e) {
        printf("Booking request failed, error: %s\n", e.what());
        return nullptr;
    }
}
