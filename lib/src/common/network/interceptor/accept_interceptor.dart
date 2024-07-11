import 'package:dio/dio.dart';

class AcceptInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'accept': '*/*',
      'accept-language': 'ru-RU',
      'connection': 'keep-alive',
    });
    handler.next(options);
  }
}
