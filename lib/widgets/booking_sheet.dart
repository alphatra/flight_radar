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

  Future<void> _createBooking(int flightId, String seatNumber, String passengerName) async {
    final url = Uri.parse('http://192.168.100.4:8080/createBooking');

    // Data to send in the request body
    final Map<String, dynamic> data = {
      'flightId': flightId,
      'seatNumber': seatNumber,
      'passengerName': passengerName,
    };

    // Request headers
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Set content type to JSON
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data), // Encode data as JSON
      );

      if (response.statusCode == 200) {
        // Success: Booking created successfully
        print('Booking created successfully');
      } else {
        // Error: Booking creation failed
        print('Error creating booking: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or other exceptions
      print('An unexpected error occurred: $e');
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
