import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open("libne.so")  // Nazwa twojej skompilowanej biblioteki C++
    : DynamicLibrary.process();

typedef FetchFlightsFunc = Pointer<Utf8> Function();
typedef FetchFlights = Pointer<Utf8> Function();
typedef FetchFlightsFromCityFunc = Pointer<Utf8> Function(Pointer<Utf8>);
typedef FetchFlightsFromCity = Pointer<Utf8> Function(Pointer<Utf8>);
class FlightService {
  late final FetchFlights _fetchFlights;

  FlightService(DynamicLibrary dynamicLibrary) {
    _fetchFlights = dynamicLibrary
        .lookup<NativeFunction<FetchFlightsFunc>>('fetchFlights')
        .asFunction();
  }

  Future<String> getFlights() async {
    final responsePtr = _fetchFlights();
    final response = responsePtr.toDartString();
    malloc.free(responsePtr);  // Pamiętaj o zwolnieniu pamięci
    return response;
  }
  Future<String> getFlightsFromCity(String city) async {
    final fetchFlightsFromCity = nativeLib.lookup<NativeFunction<FetchFlightsFromCityFunc>>('fetchFlightsFromCity')
        .asFunction<FetchFlightsFromCity>();

    final cityPtr = city.toNativeUtf8();
    final responsePtr = fetchFlightsFromCity(cityPtr);
    final response = responsePtr.toDartString();

    malloc.free(cityPtr);
    malloc.free(responsePtr);

    return response;
  }
}
