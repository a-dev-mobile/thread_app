import 'package:dio/dio.dart';

/// Для пушей отпраявляем нашему бэку fcmToken полученый через FirebaseMessage,
/// что-бы наш бэк мог отправлять пуши
class FCMTokenInterceptor extends InterceptorsWrapper {
  FCMTokenInterceptor({required this.fcmToken});

  final String? fcmToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (fcmToken != null) {
      options.headers.addAll({'fcm-token': fcmToken});
    }
    handler.next(options);
  }
}
