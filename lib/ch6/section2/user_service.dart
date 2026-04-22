// dio 초기화 하고
// widget 에서 networking 시 호출할 함수를 가지는 클래스

import 'package:dio/dio.dart';
import 'package:flutter_lab/ch6/section2/interceptor/header_interceptor.dart';
import 'package:flutter_lab/ch6/section2/interceptor/log_interceptor.dart';

import '../../ch6/section2/user.dart';

class UserService {
  late final Dio _dio;

  UserService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
    ));

    // interceptor 등록.. 등록 순서대로 실행된다. 순서 중요할 수 있다.
    _dio.interceptors.add(LoggingInterceptor());
    _dio.interceptors.add(HeaderInterceptor());
  }

  // 위젯에서.. 네트워킹시 호출할 함수
  Future<User> getUserById(int id) async {
    final reponse = await _dio.get('/users/$id');
    return User.fromJson(reponse.data);
  }
}