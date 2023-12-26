#include "json.hpp"
#include <string>   
#include <vector>
#include <cstdlib>
#include <ctime>

using json = nlohmann::json;

json generateFlight() {
    // Przykładowe dane do generowania lotów
    static const std::vector<std::string> airlines = {"KLM", "LOT", "Lufthansa", "Ryanair"};
    static const std::vector<std::string> origins = {"Londyn", "Warszawa", "Berlin", "Paryż"};
    static const std::vector<std::string> destinations = {"Gdańsk", "Kraków", "Wrocław", "Poznań"};
    static const std::vector<std::string> statuses = {"On Time", "Delayed", "Cancelled"};

    json flight;
    flight["flightNumber"] = "FL" + std::to_string(rand() % 900 + 100);
    flight["airline"] = airlines[rand() % airlines.size()];
    flight["origin"] = origins[rand() % origins.size()];
    flight["destination"] = destinations[rand() % destinations.size()];
    flight["departureTime"] = "2023-12-01T14:26:57";
    flight["arrivalTime"] = "2023-12-01T20:26:57";
    flight["status"] = statuses[rand() % statuses.size()];

    return flight;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
const char* get_flights_data() {
    srand(time(nullptr));

    json allFlights;
    for (int i = 0; i < 1000; ++i) {
        allFlights.push_back(generateFlight());
    }

    static std::string flightsJsonString = allFlights.dump();
    return flightsJsonString.c_str();
}
