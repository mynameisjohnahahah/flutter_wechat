import 'package:dio/dio.dart';
import 'http.dart';

Dio dio = new Dio();

class Api {
  login (params) {
    return Http().get('/A/all', data: params);
  }
}