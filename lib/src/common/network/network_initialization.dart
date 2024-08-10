import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/util/dio_proxy.dart';
import 'package:thread/src/common/util/http_log_interceptor.dart';
import 'package:thread/src/feature/app/controller/app_controller.dart';

final l = L('network_initialization');

Future<void> initializeNetworkDependencies(Dependencies dependencies) async {
  dependencies.dio = Dio(
    BaseOptions(
      baseUrl: dependencies.appController.state.appEnv.apiBaseUrl,
      connectTimeout: Config.apiConnectTimeout,
      receiveTimeout: Config.apiReceiveTimeout,
      headers: <String, String>{
        Headers.acceptHeader: Headers.jsonContentType,
      },
      receiveDataWhenStatusError: false, // Don't convert 4XX & 5XX to JSON
    ),
  )..useProxy();

  dependencies.dio.interceptors.addAll(<Interceptor>[
    const HttpLogInterceptor(),
    RetryInterceptor(
      dio: dependencies.dio,
      logPrint: (message) => l.tNoStack('RetryInterceptor | API | $message'),
      retries: 3,
      retryDelays: const <Duration>[
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 10),
      ],
    ),
  ]);
}
