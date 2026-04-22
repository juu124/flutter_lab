import 'dart:ffi';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor{
  // 모든 요청이 이 함수를 거쳐서 전달 되게끔 하기
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final time = DateTime.now().toString();
    print('[$time] request url : ${options.baseUrl} ${options.path}');
    // reject : 요청 중단 된다.
    // handler.reject(null);

    // 백엔드 요청을 하지 않고, 가상의 데이터로 응답을 처리한다.
    // handler.resolve(response);

    // 다음 실행(다음 인터셉터 혹인 백엔드 요청)
    handler.next(options);
  }

  // 모든 응답이 이 함수를 거치게
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    print('response code : ${response.statusCode}');
    handler.next(response);
  }
}