import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/app_metadata_initialization.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/network/network_initialization.dart';
import 'package:thread/src/common/routing/app_route_information_parser.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/feature/initialization/data/platform/platform_initialization.dart';

final l = L('initialize_dependencies');

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
      l.dNoStack('$currentStep/$totalSteps ($percent%) | "${step.key}"');
      await step.value(dependencies);
    } on Object catch (error, stackTrace) {
      l.e('Initialization failed at step "${step.key}": $error', error: error, stackTrace: stackTrace);
      Error.throwWithStackTrace('Initialization failed at step "${step.key}": $error', stackTrace);
    }
  }
  return dependencies;
}

typedef _InitializationStep = FutureOr<void> Function(Dependencies dependencies);
final Map<String, _InitializationStep> _initializationSteps = <String, _InitializationStep>{
  'Platform pre-initialization': (_) => $platformInitialization(),
  'Creating app metadata': initializeAppMetadata, // используем новую функцию
  'Initializing router delegate': (dependencies) => dependencies.routerDelegate = AppRouterDelegate(),
  'Initializing route information parser': (dependencies) =>
      dependencies.routeInformationParser = AppRouteInformationParser(),
  'Initializing analytics': (_) async {
    await Future.delayed(const Duration(seconds: 1));
  },
  'Log app open': (_) async {
    await Future.delayed(const Duration(seconds: 1));
  },
  'Get remote config': (_) async {
    await Future.delayed(const Duration(seconds: 1));
  },
  'Restore settings': (_) {
    l.iNoStack('Application initialized info.');
    l.dNoStack('Application initialized debug.');
    l.e('Application initialized error.');
  },
  'Initialize shared preferences': (dependencies) async =>
      dependencies.sharedPreferences = await SharedPreferences.getInstance(),
  'API Client and Interceptors': initializeNetworkDependencies, // используем новую функцию
  'Initialize localization': (_) {},
  'Log app initialized': (_) {},
};
