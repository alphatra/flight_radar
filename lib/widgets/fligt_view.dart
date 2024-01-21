import 'package:flutter/material.dart';

class FlightListView extends StatelessWidget {
  final List<dynamic> flights;

  FlightListView({required this.flights});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) {
        var flight = flights[index];
        return ListTile(
          title: Text('Lot ${flight['flight_id']}'),
          subtitle: Text('Linia lotnicza: ${flight['airline']}'),
          // Dodaj więcej informacji o locie, jeśli potrzebujesz
        );
      },
    );
  }
}
