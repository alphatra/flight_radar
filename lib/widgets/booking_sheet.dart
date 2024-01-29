import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingSheet extends StatefulWidget {
  final dynamic flight;

  const BookingSheet({Key? key, required this.flight}) : super(key: key);

  @override
  _BookingSheetState createState() => _BookingSheetState();
}

class _BookingSheetState extends State<BookingSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _seatController = TextEditingController();

  // Importy i definicje klas

  Future<void> _createBooking(int flightId, String seatNumber, String passengerName) async {
    final uri = Uri.parse('http://192.168.100.4:8080/createBooking/$flightId/$seatNumber/$passengerName');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // Sukces
        print('Booking created successfully');
      } else {
        // Błąd
        print('Error creating booking: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception when calling createBooking: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Flight Booking', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: _seatController,
              decoration: InputDecoration(
                labelText: 'Seat Number (e.g., 12A)',
              ),
            ),
            ElevatedButton(
              child: Text('Book'),
              onPressed: () {
                // Extract flight ID from the widget's flight data
                int flightId = int.tryParse(widget.flight['flight_id']) ?? 0; // Provide a default value if parsing fails

                // Call the _createBooking function with the extracted flight ID
                _createBooking(flightId, _seatController.text, _nameController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
