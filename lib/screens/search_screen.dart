import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';
import 'package:intl/intl.dart'; // Do formatowania dat
import 'package:gap/gap.dart';
import 'package:flight_radar/widgets/booking_sheet.dart';

class SearchScreen extends StatefulWidget {
  final String title;

  const SearchScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final FlightService flightService;
  late Future<Map<String, List<dynamic>>> flightsByCity;

  @override
  void initState() {
    super.initState();
    flightService = FlightService(nativeLib);
    flightsByCity = fetchFlightsData();
  }

  Future<Map<String, List<dynamic>>> fetchFlightsData() async {
    String flightsJson = await flightService.getFlights();
    Map<String, dynamic> decodedJson = jsonDecode(flightsJson);
    List<dynamic> flightsList = decodedJson['flights'];
    Map<String, List<dynamic>> flightsMap = {};

    for (var flight in flightsList) {
      String city = flight['origin_city'] ?? 'Other';
      flightsMap.putIfAbsent(city, () => []).add(flight);
    }
    return flightsMap;
  }


  void _showBookingSheet(BuildContext context, dynamic flight) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BookingSheet(flight: flight);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<Map<String, List<dynamic>>>(
        future: flightsByCity,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No flights found'));
          } else {
            return ListView(
              children: snapshot.data!.entries.map((entry) {
                return ExpansionTile(
                  title: Text(entry.key),
                  children: entry.value.map<Widget>((flight) {
                    return buildFlightTile(context, flight);
                  }).toList(),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  Widget buildFlightTile(BuildContext context, dynamic flight) {
    String flightId = flight['flight_id']?.toString() ?? 'Nieznany';
    String airline = flight['airline'] ?? 'Nieznana linia';
    String departureTime = flight['departure_time'] != null
        ? DateFormat('yyyy-MM-dd – HH:mm').format(DateTime.parse(flight['departure_time']))
        : 'Brak danych';
    String arrivalTime = flight['arrival_time'] != null
        ? DateFormat('yyyy-MM-dd – HH:mm').format(DateTime.parse(flight['arrival_time']))
        : 'Brak danych';
    String price = flight['price']?.toString() ?? 'Brak ceny';
    String status = flight['status'] ?? 'Brak statusu';
    String origin = flight['origin_city'] ?? 'Nieznane';
    String destination = flight['destination_city'] ?? 'Nieznane';

    return InkWell(
      onTap: () => _showBookingSheet(context, flight),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.flight, color: Colors.blue, size: 24),
                  Gap(8),
                  Expanded(
                    child: Text('Lot $flightId', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Text('$price zł', style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
                ],
              ),
              Gap(8),
              Text('$origin → $destination', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Gap(8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Wylot', style: TextStyle(color: Colors.grey[600])),
                        Text(departureTime, style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Przylot', style: TextStyle(color: Colors.grey[600])),
                        Text(arrivalTime, style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(8),
              Text('Linia lotnicza: $airline', style: TextStyle(fontSize: 16)),
              Text('Status: $status', style: TextStyle(fontSize: 16, color: Colors.deepOrange)),
            ],
          ),
        ),
      ),
    );
  }
}
