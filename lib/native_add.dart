import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open("libna.so")  // Nazwa twojej skompilowanej biblioteki C++
    : DynamicLibrary.process();

typedef GetFlightsDataFunc = Pointer<Utf8> Function();
final GetFlightsDataFunc getFlightsData = nativeLib
    .lookup<NativeFunction<GetFlightsDataFunc>>("get_flights_data")
    .asFunction();

String fetchFlightsData() {
  final pointer = getFlightsData();
  final jsonData = pointer.toDartString();
  // Nie zwalniaj pamięci tutaj, ponieważ jest ona zarządzana przez C++
  return jsonData;
}