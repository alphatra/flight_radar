import 'dart:convert';
import 'package:flight_radar/models/flight_info.dart';
import 'package:flight_radar/native_add.dart'; // Upewnij się, że ścieżka jest poprawna

class FlightService {
  static FlightInfo parseFlightInfo(String jsonData) {
    try {
      Map<String, dynamic> jsonMap = json.decode(jsonData);
      return FlightInfo.fromJson(jsonMap);
    } catch (e) {
      print('Error parsing JSON: $e');
      return FlightInfo(title: 'Error', flightNumber: 'N/A', status: 'Error');
    }
  }

  static String fetchFlightData() {
    return fetchJsonData(); // Używamy funkcji z native_add.dart
  }
}
