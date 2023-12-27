import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/native_add.dart';
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  final String title;

  const SearchScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

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
