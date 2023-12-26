import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open("libna.so")
    : DynamicLibrary.process();

typedef hello_world_func = Pointer<Utf8> Function();
typedef HelloWorldFunc = Pointer<Utf8> Function();

final int Function(int x, int y) nativeAdd =
nativeLib
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
    .asFunction();


final HelloWorldFunc helloWorld = nativeLib
    .lookup<NativeFunction<hello_world_func>>("hello_world")
    .asFunction();

String getHelloWorldString() {
  final pointer = helloWorld();
  final String result = pointer.toDartString();
  // Nie zwalniaj pamięci tutaj, ponieważ jest ona zarządzana przez C++
  return result;
}

typedef get_json_data_func = Pointer<Utf8> Function();
typedef GetJsonDataFunc = Pointer<Utf8> Function();

final GetJsonDataFunc getJsonData = nativeLib
    .lookup<NativeFunction<get_json_data_func>>("get_json_data")
    .asFunction();

String fetchJsonData() {
  final pointer = getJsonData();
  final String jsonData = pointer.toDartString();
  // Nie zwalniaj pamięci tutaj, ponieważ jest ona zarządzana przez C++
  return jsonData;
}
