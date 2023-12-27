import 'package:flutter/material.dart';
import 'package:flight_radar/screens/home_screen.dart'; // Import nowego pliku home_screen.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Flight Data',
      home: const MyHomePage(title: 'Flight Radar'),
    );
  }
}
