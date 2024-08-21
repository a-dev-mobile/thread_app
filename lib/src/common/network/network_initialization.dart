import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';

import 'package:thread/src/common/util/http_log_interceptor.dart';

final _l = L('network_initialization');

Future<void> initializeNetworkDependencies(Dependencies dependencies) async {
  dependencies.dio = Dio(
    BaseOptions(
      baseUrl: dependencies.appEnv.apiBaseUrl,
      connectTimeout: dependencies.appEnv.apiConnectTimeout,
      receiveTimeout: dependencies.appEnv.apiReceiveTimeout,
      headers: <String, String>{
        Headers.acceptHeader: Headers.jsonContentType,
      },
      receiveDataWhenStatusError: false, // Don't convert 4XX & 5XX to JSON
    ),
  );

  dependencies.dio.interceptors.addAll(<Interceptor>[
    const HttpLogInterceptor(),
    RetryInterceptor(
      dio: dependencies.dio,
      logPrint: (message) => _l.tNoStack('RetryInterceptor | API | $message'),
      retries: 3,
      retryDelays: const <Duration>[
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 10),
      ],
    ),
  ]);
}
