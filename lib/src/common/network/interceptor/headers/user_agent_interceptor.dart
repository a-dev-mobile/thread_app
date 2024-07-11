import 'package:dio/dio.dart';

class UserAgentInterceptor extends InterceptorsWrapper {
  UserAgentInterceptor(this.userAgent);

  final String userAgent;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['user-agent'] = userAgent;

    handler.next(options);
  }
}
