import 'package:flutter/material.dart';
import 'native_add.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Data',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String jsonData = fetchFlightsData();
    List<dynamic> flightList = json.decode(jsonData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flights Info'),
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
