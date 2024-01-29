import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  final String title;

  const ProfileScreen({Key? key, required this.title}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  late Future<List<dynamic>> reservedSeats;

  @override
  void initState() {
    super.initState();
    reservedSeats = fetchReservedSeats();
  }

  Future<List<dynamic>> fetchReservedSeats() async {
    FlightService flightService = FlightService(nativeLib);
    String responseJson = await flightService.fetchReservedSeats();
    return jsonDecode(responseJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: reservedSeats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No reservations found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var booking = snapshot.data![index];
                return ListTile(
                  title: Text(booking['passenger_name']),
                  subtitle: Text('Flight ID: ${booking['flight_id']}, Seat: ${booking['seat_number']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
