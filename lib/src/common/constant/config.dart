// ignore_for_file: avoid_classes_with_only_static_members

/// Config for app.
abstract final class Config {
  // --- API --- //
  static const String apiBaseUrlDev = String.fromEnvironment('API_BASE_URL_DEV', defaultValue: '');
  static const String apiBaseUrlProd = String.fromEnvironment('API_BASE_URL_PROD', defaultValue: '');

  // /// Proxy for api.
  // /// e.g. http://10.0.2.2:8080
  // static const String proxyUrl = String.fromEnvironment('HTTP_PROXY', defaultValue: '');

  // /// Timeout in milliseconds for opening url.
  // /// [Dio] will throw the [DioException] with [DioExceptionType.connectTimeout] type when time out.
  // /// e.g. 15000
  // static const Duration apiConnectTimeout =
  //     Duration(milliseconds: int.fromEnvironment('API_CONNECT_TIMEOUT', defaultValue: 15000));

  // /// Timeout in milliseconds for receiving data from url.
  // /// [Dio] will throw the [DioException] with [DioExceptionType.receiveTimeout] type when time out.
  // /// e.g. 10000
  // static const Duration apiReceiveTimeout =
  //     Duration(milliseconds: int.fromEnvironment('API_RECEIVE_TIMEOUT', defaultValue: 10000));

  // /// Cache lifetime.
  // /// Refetch data from url when cache is expired.
  // /// e.g. 1 hour
  // static const Duration cacheLifetime = Duration(hours: 1);

  // // --- LAYOUT --- //

  // /// Maximum screen layout width for screen with list view.
  // static const int maxScreenLayoutWidth = int.fromEnvironment('MAX_LAYOUT_WIDTH', defaultValue: 768);
}
