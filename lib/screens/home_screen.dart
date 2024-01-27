import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';
import 'package:flight_radar/widgets/flight_search_bar.dart';
import 'package:flight_radar/widgets/fligt_view.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FlightService flightService;
  late Future<List<dynamic>> flights;

  @override
  void initState() {
    super.initState();
    flightService = FlightService(nativeLib);
    flights = fetchFlightsData();
  }

  Future<List<dynamic>> fetchFlightsData({Map<String, dynamic>? searchParams}) async {
    String flightsJson;
    if (searchParams == null || searchParams.isEmpty) {
      flightsJson = await flightService.getFlights();
    } else {
      String fromCity = searchParams['from'] ?? '';
      String toCity = searchParams['to'] ?? '';
      String departureDate = searchParams['departureDate'] ?? '';
      String returnDate = searchParams['returnDate'] ?? '';
      int adultCount = searchParams['adultCount'] ?? 1;

      if (fromCity.isNotEmpty && toCity.isNotEmpty && departureDate.isNotEmpty && returnDate.isNotEmpty) {
        flightsJson = await flightService.getFlightsFromToWithDateRange(
            fromCity, toCity, departureDate, returnDate, adultCount
        );
      } else if (fromCity.isNotEmpty && toCity.isNotEmpty) {
        flightsJson = await flightService.getFlightsFromTo(fromCity, toCity);
      } else if (fromCity.isNotEmpty) {
        flightsJson = await flightService.getFlightsFromCity(fromCity);
      } else {
        flightsJson = await flightService.getFlights();
      }
    }

    var decodedJson = jsonDecode(flightsJson);
    if (decodedJson is List) {
      return decodedJson;
    } else if (decodedJson is Map<String, dynamic>) {
      return decodedJson['flights'];
    } else {
      throw FormatException('Nieoczekiwany format danych');
    }
  }

  void onSearch(Map<String, dynamic> searchParams) {
    setState(() {
      flights = fetchFlightsData(searchParams: searchParams);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          FlightSearchBar(onSearch: onSearch),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: flights,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Błąd: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Brak dostępnych lotów'));
                } else {
                  return FlightListView(flights: snapshot.data!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
