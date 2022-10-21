
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class JsonQuery {

  static String baseUrl = 'https://jsonplaceholder.typicode.com/';

  Future<Response?> getJsonData( { required String endpoint } ) async {
    Response? response;

    try {
      response = await Dio().get(baseUrl + endpoint);
    } catch ( error ) {
      if (kDebugMode) {
        print(error);
      }
    }

    return response;
  }

}