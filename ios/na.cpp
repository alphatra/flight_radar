#include "HTTPRequest.hpp"
#include <string>
#include <exception>
#include <cstdio>
#include "httplib.h"
#include "json.hpp"

const std::string BASE_URL = "http://192.168.100.4:8080";

std::string generateURL(const std::string& endpoint, const std::vector<std::string>& parameters = {}) {
    std::string url = BASE_URL + endpoint;

    for (const std::string& parameter : parameters) {
        url += "/" + parameter;
    }

    return url;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
const char* fetchFlights() {
    try {
        auto url = generateURL("/flights");

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
const char* fetchFlightsFromCity(const char* cityName) {
    try {
        auto url = generateURL("/flights/fromCity", { cityName });

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
const char* fetchFlightsFromTo(const char* fromCity, const char* toCity) {
    try {
        auto url = generateURL("/flights/fromTo", { fromCity, toCity });

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
const char* createBooking(int flightId, const char* seatNumber, const char* passengerName) {
    try {
        httplib::Client cli("http://192.168.100.4:8080");

        // Utwórz obiekt JSON z danymi rezerwacji
        nlohmann::json bookingData = {
                {"flightId", flightId},
                {"seatNumber", seatNumber},
                {"passengerName", passengerName}
        };

        // Wyślij zapytanie POST
        auto res = cli.Post("/createBooking", bookingData.dump(), "application/json");

        if (res && res->status == 200) {
            char* cstr = new char[res->body.size() + 1];
            std::strcpy(cstr, res->body.c_str());
            return cstr;
        } else {
            printf("Booking request failed, status: %d\n", res->status);
            return nullptr;
        }
    } catch (const std::exception& e) {
        printf("Booking request failed, error: %s\n", e.what());
        return nullptr;
    }
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
const char* fetchFlightsFromToWithDateRange(const char* originCity, const char* destinationCity, const char* startDate, const char* endDate) {
    try {
        auto url = generateURL("/flights/fromToWithDateRange", { originCity, destinationCity, startDate, endDate }); // Default value for numberOfSeats is 0

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
const char* fetchReservedSeats() {
    try {
        httplib::Client cli(BASE_URL);
        auto res = cli.Get("/reservedSeats");

        if (res && res->status == 200) {
            char* cstr = new char[res->body.size() + 1];
            std::strcpy(cstr, res->body.c_str());
            return cstr;
        } else {
            // Handle error or null response
            printf("Request failed, status: %d\n", res ? res->status : 0);
            return nullptr;
        }

    } catch (const std::exception& e) {
        printf("Request failed, error: %s\n", e.what());
        return nullptr;
    }
}