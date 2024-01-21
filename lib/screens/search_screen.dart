import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  final String title;

  const SearchScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final FlightService flightService;
  late Future<List<dynamic>> flights;

  @override
  void initState() {
    super.initState();
    flightService = FlightService(nativeLib);
    flights = fetchFlightsData();
  }

  Future<List<dynamic>> fetchFlightsData() async {
    String flightsJson = await flightService.getFlights();
    Map<String, dynamic> decodedJson = jsonDecode(flightsJson);
    return decodedJson['flights'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<List<dynamic>>(
        future: flights,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No flights found');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var flight = snapshot.data![index];
                return ListTile(
                  title: Text('Flight ${flight['flight_id']}'),
                  subtitle: Text('Airline: ${flight['airline']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
