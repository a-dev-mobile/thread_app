import 'package:dio/dio.dart';

class ContentTypeInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.method == 'PATCH' || !options.headers.containsKey('content-type')) {
      options.headers['content-type'] = 'application/json';
    } else if (options.method == 'POST' && options.data is FormData) {
      options.headers['content-type'] = 'image/png';
    }

    handler.next(options);
  }
}
