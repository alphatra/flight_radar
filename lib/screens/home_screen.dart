import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';

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

  @override
  Widget build(BuildContext context) {
    String jsonData = fetchFlightsData();
    List<dynamic> flightList = json.decode(jsonData);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: flightList.length,
        itemBuilder: (context, index) {
          var flight = flightList[index];
          return ListTile(
            title: Text(flight['flightNumber']),
            subtitle: Text('${flight['origin']} -> ${flight['destination']}'),
            trailing: Text(flight['status']),
          );
        },
      ),
    );
  }
}
