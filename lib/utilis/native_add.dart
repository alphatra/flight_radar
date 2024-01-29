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
typedef FetchFlightsFromToFunc = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef FetchFlightsFromTo = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef FetchFlightsFromToWithDateRangeFunc = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Int32);
typedef FetchFlightsFromToWithDateRange = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, int);
typedef CreateBookingFunc = Pointer<Utf8> Function(Int32 flightId, Pointer<Utf8> seatNumber, Pointer<Utf8> passengerName);
typedef CreateBooking = Pointer<Utf8> Function(int flightId, Pointer<Utf8> seatNumber, Pointer<Utf8> passengerName);
typedef FetchReservedSeatsFunc = Pointer<Utf8> Function();
typedef FetchReservedSeats = Pointer<Utf8> Function();
class FlightService {
  late final FetchFlights _fetchFlights;
  late final FetchFlightsFromCity _fetchFlightsFromCity;
  late final FetchFlightsFromTo _fetchFlightsFromTo;
  late final FetchFlightsFromToWithDateRange _fetchFlightsFromToWithDateRange;
  late final CreateBooking _createBooking;
  late final FetchReservedSeats _fetchReservedSeats;
  FlightService(DynamicLibrary dynamicLibrary) {
    _fetchFlights = dynamicLibrary
        .lookup<NativeFunction<FetchFlightsFunc>>('fetchFlights')
        .asFunction();
    _fetchFlightsFromCity = dynamicLibrary
        .lookup<NativeFunction<FetchFlightsFromCityFunc>>('fetchFlightsFromCity')
        .asFunction();
    _fetchFlightsFromTo = dynamicLibrary
        .lookup<NativeFunction<FetchFlightsFromToFunc>>('fetchFlightsFromTo')
        .asFunction();
    _fetchFlightsFromToWithDateRange = dynamicLibrary
        .lookup<NativeFunction<FetchFlightsFromToWithDateRangeFunc>>('fetchFlightsFromToWithDateRange')
        .asFunction();
    _createBooking = dynamicLibrary
        .lookup<NativeFunction<CreateBookingFunc>>('createBooking')
        .asFunction();
    _fetchReservedSeats = dynamicLibrary
        .lookup<NativeFunction<FetchReservedSeatsFunc>>('fetchReservedSeats')
        .asFunction();
  }

  Future<String> getFlights() async {
    final responsePtr = _fetchFlights();
    final response = responsePtr.toDartString();
    malloc.free(responsePtr);
    return response;
  }

  Future<String> getFlightsFromCity(String city) async {
    final cityPtr = city.toNativeUtf8();
    final responsePtr = _fetchFlightsFromCity(cityPtr);
    final response = responsePtr.toDartString();

    malloc.free(cityPtr);
    malloc.free(responsePtr);

    return response;
  }

  Future<String> getFlightsFromTo(String fromCity, String toCity) async {
    final fromCityPtr = fromCity.toNativeUtf8();
    final toCityPtr = toCity.toNativeUtf8();
    final responsePtr = _fetchFlightsFromTo(fromCityPtr, toCityPtr);
    final response = responsePtr.toDartString();

    malloc.free(fromCityPtr);
    malloc.free(toCityPtr);
    malloc.free(responsePtr);

    return response;
  }

  Future<String> getFlightsFromToWithDateRange(String originCity, String destinationCity, String startDate, String endDate, int adultCount) async {
    final originCityPtr = originCity.toNativeUtf8();
    final destinationCityPtr = destinationCity.toNativeUtf8();
    final startDatePtr = startDate.toNativeUtf8();
    final endDatePtr = endDate.toNativeUtf8();

    final responsePtr = _fetchFlightsFromToWithDateRange(
        originCityPtr, destinationCityPtr, startDatePtr, endDatePtr, adultCount
    );

    final response = responsePtr.toDartString();

    malloc.free(originCityPtr);
    malloc.free(destinationCityPtr);
    malloc.free(startDatePtr);
    malloc.free(endDatePtr);
    malloc.free(responsePtr);

    return response;
  }
  Future<String> createBooking(int flightId, String seatNumber, String passengerName) async {
    final seatNumberPtr = seatNumber.toNativeUtf8();
    final passengerNamePtr = passengerName.toNativeUtf8();

    final responsePtr = _createBooking(flightId, seatNumberPtr, passengerNamePtr);
    final response = responsePtr.toDartString();

    malloc.free(seatNumberPtr);
    malloc.free(passengerNamePtr);
    malloc.free(responsePtr);

    return response;
  }
  Future<String> fetchReservedSeats() async {
    final responsePtr = _fetchReservedSeats();
    final response = responsePtr.toDartString();
    malloc.free(responsePtr);
    return response;
  }
}
