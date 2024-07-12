import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l.dart';

import 'package:thread/src/common/model/app_metadata.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/util/dio_proxy.dart';
import 'package:thread/src/common/util/http_log_interceptor.dart';
import 'package:thread/src/common/util/log_buffer.dart';
import 'package:thread/src/common/util/screen_util.dart';

import 'package:thread/src/feature/authentication/data/authentication_repository.dart';

import 'package:thread/src/feature/initialization/data/platform/platform_initialization.dart';

/// Initializes the app and returns a [Dependencies] object
Future<Dependencies> $initializeDependencies({
  void Function(int progress, String message)? onProgress,
}) async {
  final dependencies = Dependencies();
  final totalSteps = _initializationSteps.length;
  var currentStep = 0;
  for (final step in _initializationSteps.entries) {
    try {
      currentStep++;
      final percent = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
      onProgress?.call(percent, step.key);
      l.v6('Initialization | $currentStep/$totalSteps ($percent%) | "${step.key}"');
      await step.value(dependencies);
    } on Object catch (error, stackTrace) {
      l.e('Initialization failed at step "${step.key}": $error', stackTrace);
      Error.throwWithStackTrace('Initialization failed at step "${step.key}": $error', stackTrace);
    }
  }
  return dependencies;
}

typedef _InitializationStep = FutureOr<void> Function(Dependencies dependencies);
final Map<String, _InitializationStep> _initializationSteps = <String, _InitializationStep>{
  'Platform pre-initialization': (_) => $platformInitialization(),
  'Creating app metadata': (dependencies) => dependencies.metadata = AppMetadata(
        isWeb: false,
        isRelease: false,
        appName: Pubspec.name,
        appVersion: Pubspec.version.representation,
        appVersionMajor: Pubspec.version.major,
        appVersionMinor: Pubspec.version.minor,
        appVersionPatch: Pubspec.version.patch,
        appBuildTimestamp:
            Pubspec.version.build.isNotEmpty ? (int.tryParse(Pubspec.version.build.firstOrNull ?? '-1') ?? -1) : -1,
        operatingSystem: ' platform.operatingSystem.name',
        processorsCount: 7777,
        appLaunchedTimestamp: DateTime.now(),
        locale: 'platform.locale',
        deviceVersion: 'platform.version',
        deviceScreenSize: ScreenUtil.screenSize().representation,
      ),
  'Initializing analytics': (_) {},
  'Log app open': (_) {},
  'Get remote config': (_) {},
  'Restore settings': (_) {},
  'Initialize shared preferences': (dependencies) async =>
      dependencies.sharedPreferences = await SharedPreferences.getInstance(),
  'API Client': (dependencies) => dependencies.dio = Dio(
        BaseOptions(
          baseUrl: Config.apiBaseUrl,
          connectTimeout: Config.apiConnectTimeout,
          receiveTimeout: Config.apiReceiveTimeout,
          headers: <String, String>{
            /* 'Connection': 'Close', */
            Headers.acceptHeader: Headers.jsonContentType,
          },
          receiveDataWhenStatusError: false, // Don't convert 4XX & 5XX to JSON
        ),
      )..useProxy(),
  'Add API interceptors': (dependencies) {
    dependencies.dio.interceptors.addAll(<Interceptor>[
      const HttpLogInterceptor(),
      // TODO(plugfox): add sentry interceptor
      // TODO(plugfox): save all requests to database
      // TODO(plugfox): add cache interceptor
      /* AuthenticationInterceptor(
        token: () => authenticator.user.sessionId ?? (throw StateError('User is not logged in')),
        logout: () => Future<void>.sync(authenticator.logOut),
        refresh: () => Future<void>.sync(authenticator.refresh),
        retry: (options) => apiClient.fetch(options),
      ), */
      RetryInterceptor(
        dio: dependencies.dio,
        logPrint: (message) => l.w('RetryInterceptor | API | $message'),
        retries: 3, // retry count (optional)
        retryDelays: const <Duration>[
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 10), // wait 3 sec before third retry
        ],
      ),
    ]);
  },
  'Initialize localization': (_) {},
  'Log app initialized': (_) {},
};
