import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';
import 'package:gap/gap.dart';

import 'package:flight_radar/widgets/search_bar.dart';
import 'package:flight_radar/widgets/fligt_view.dart';
import 'package:flight_radar/widgets/date_picker.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

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

  Future<List<dynamic>> fetchFlightsData({String city = ''}) async {
    String flightsJson;
    if (city.isEmpty) {
      flightsJson = await flightService.getFlights(); // Pobieranie wszystkich lotów
    } else {
      flightsJson = await flightService.getFlightsFromCity(city); // Pobieranie lotów z danego miasta
    }
    var decodedJson = jsonDecode(flightsJson);

    // Jeśli otrzymany JSON to lista, zwróć ją bezpośrednio
    if (decodedJson is List) {
      return decodedJson;
    }

    // Jeśli otrzymany JSON to mapa, przetwarzaj dalej
    if (decodedJson is Map<String, dynamic>) {
      return decodedJson['flights'];
    }

    throw FormatException('Nieoczekiwany format danych');
  }

  void onSearch(String city) {
    setState(() {
      flights = fetchFlightsData(city: city);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          FlightSearchBar(onSearch: onSearch), // Pasek wyszukiwania
          DatePicker(), // Wybór daty
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: flights,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Błąd: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('Brak dostępnych lotów');
                } else {
                  return FlightListView(flights: snapshot.data!); // Lista lotów
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
