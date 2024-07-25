import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/util/error_util.dart';
import 'package:thread/src/common/widget/app.dart';
import 'package:thread/src/common/widget/app_error.dart';
import 'package:thread/src/feature/initialization/data/initialization.dart';
import 'package:thread/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:thread/src/feature/settings/widget/settings_scope.dart';

final l = L('main');

void main() {
  runZonedGuarded<void>(
    () {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      l.iNoStack('starting application');

      final initializationProgress = ValueNotifier<({int progress, String message})>((progress: 0, message: ''));
      // runApp(SplashScreen(progress: initializationProgress)); // Включить SplashScreen

      $initializeApp(
        onProgress: (progress, message) => initializationProgress.value = (progress: progress, message: message),
        onSuccess: (dependencies) {
          FlutterNativeSplash.remove(); // Убираем сплэш-экран после завершения инициализации
          runApp(
            InheritedDependencies(
              dependencies: dependencies,
              child: const App(),
            ),
          );
        },
      ).catchError((error, stackTrace) {
        FlutterNativeSplash.remove(); // Убираем сплэш-экран в случае ошибки
        ErrorUtil.logError(error, stackTrace).ignore();
        runApp(AppError(error: error));

        // Return a placeholder Dependencies object
        return Dependencies(
            // Provide appropriate default values for Dependencies
            );
      });
    },
    (error, stackTrace) {
      ErrorUtil.logError(error, stackTrace).ignore();
    },
  );
}
