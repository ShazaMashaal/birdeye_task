import 'package:dio/dio.dart';

class DioHelper {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com/';
  static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;

  static Future<Response<dynamic>>? get(String path) {
    return dioSingleton.get(path);
  }
}
