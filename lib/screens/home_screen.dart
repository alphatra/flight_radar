import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';
import 'bottom_navbar.dart'; // Import nowego pliku bottom_navbar.dart

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    String jsonData = fetchFlightsData();
    List<dynamic> flightList = json.decode(jsonData);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: currentPageIndex,
        onItemSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
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