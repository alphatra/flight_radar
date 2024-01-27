import 'package:flight_radar/utilis/native_add.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Do formatowania dat
import 'package:gap/gap.dart';
import 'package:flight_radar/widgets/booking_sheet.dart';
class FlightListView extends StatelessWidget {
  final List<dynamic> flights;

  FlightListView({required this.flights});

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
    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) {
        var flight = flights[index];

        // Dodanie sprawdzenia wartości null i zapewnienie domyślnych wartości
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
            onTap: () => _showBookingSheet(context, flights[index]),
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
      },
    );
  }
}
