import 'package:dio/dio.dart';
import 'http.dart';

Dio dio = new Dio();

const Url = 'https://geffoliu.cn';

class Api {
  login (params) {
    return HttpUtil().get('/A/all', data: params);
  }
  register (params) {
    return HttpUtil().post(Url + '/users', data: params);
  }
}