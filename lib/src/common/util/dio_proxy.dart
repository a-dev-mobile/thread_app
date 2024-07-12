// ignore_for_file: prefer_expression_function_bodies

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:thread/src/common/constant/config.dart';

/// Methods for managing proxies on [Dio]
extension DioProxyX on Dio {
  /// Use a proxy to connect to the internet.
  void useProxy() {
    if (const bool.fromEnvironment('dart.library.js_util')) return;
    const proxyUrl =Config.proxyUrl;
    if (proxyUrl.isEmpty) return;
    switch (httpClientAdapter) {
      case IOHttpClientAdapter adapter:
        adapter.createHttpClient = () => HttpClient()
          ..idleTimeout = const Duration(seconds: 3)
          ..findProxy = (url) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (cert, host, post) => true;
      default:
        throw UnsupportedError('Cannot use proxy with ${httpClientAdapter.runtimeType}');
    }
  }
}
