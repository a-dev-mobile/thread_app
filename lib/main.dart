import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/util/error_util.dart';
import 'package:thread/src/common/widget/app.dart';
import 'package:thread/src/common/widget/app_error.dart';
import 'package:thread/src/common/widget/no_animation_scope.dart';
import 'package:thread/src/feature/initialization/data/initialization.dart';
import 'package:thread/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:thread/src/feature/initialization/widget/initialization_splash_screen.dart';
import 'package:thread/src/feature/visual_debug/visual_debug_controller.dart';
import 'package:thread/src/feature/visual_debug/visual_debug_provider.dart';

final _l = L('main');

void main() {
  runZonedGuarded<void>(
    () {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      _l.iNoStack('starting application');

      final initializationProgress = ValueNotifier<({int progress, String message})>((progress: 0, message: ''));
      FlutterNativeSplash.remove(); // Убираем сплэш-экран после завершения инициализации
      runApp(
        InitializationSplashScreen(progress: initializationProgress),
      );

      $initializeApp(
        onProgress: (progress, message) => initializationProgress.value = (progress: progress, message: message),
        onSuccess: (dependencies) {
          usePathUrlStrategy();
          runApp(
            InheritedDependencies(
              dependencies: dependencies,
              child: NoAnimationScope(
                child: VisualDebugProvider(
                  controller: VisualDebugController(localStorage: dependencies.localStorage)..initialize(),
                  child: const App(),
                ),
              ),
            ),
          );
        },
        // ignore: body_might_complete_normally_catch_error
      ).catchError((error, stackTrace) {
        runApp(AppError(error: error));
        ErrorUtil.logError(error, stackTrace).ignore();
      }).ignore();
    },
    (error, stackTrace) {
      ErrorUtil.logError(error, stackTrace).ignore();
    },
  );
}
