import 'dart:io';

import 'package:dio/dio.dart';

// 헤더값 조정의 인터셉터
class HeaderInterceptor extends Interceptor {
  final Map<String, dynamic> extraHeaders;

  // 나를 생성한 외부에서 지정한 헤더값을 포함시키기 위해서..
  HeaderInterceptor({this.extraHeaders = const {}});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 공통으로 들어가는 request header 설정
    options.headers[HttpHeaders.contentTypeHeader] = "application/json";
    options.headers[HttpHeaders.acceptHeader] = "application/json";
    options.headers['User-Agent'] =
        'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36';
    options.headers.addAll(extraHeaders);

    handler.next(options);
  }
}
