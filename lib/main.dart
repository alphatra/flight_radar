import 'package:flight_radar/native_add.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wywołanie funkcji helloWorld z C++ przez FFI
    final helloWorldString = getHelloWorldString();

    return Scaffold(
      appBar: AppBar(
        title: Text('FFI Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('1 + 2 == ${nativeAdd(1, 2)}'),
            SizedBox(height: 20), // Dodaje trochę przestrzeni między tekstami
            Text(helloWorldString),
          ],
        ),
      ),
    );
  }
}
