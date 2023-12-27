import 'package:flutter/material.dart';
import 'package:flight_radar/utilis/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      title: 'Flight Radar',
      routerConfig: router,
    );
  }
}
