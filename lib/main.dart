import 'dart:async';

import 'package:flutter/material.dart';

import 'package:thread/src/common/util/error_util.dart';
import 'package:thread/src/common/widget/app.dart';
import 'package:thread/src/common/widget/app_error.dart';
import 'package:thread/src/feature/initialization/data/initialization.dart';
import 'package:thread/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:thread/src/feature/settings/widget/settings_scope.dart';

void main() => runZonedGuarded<void>(
  () async {
    final initializationProgress = ValueNotifier<({int progress, String message})>((progress: 0, message: ''));
    runApp(SplashScreen(progress: initializationProgress)); // Включить SplashScreen

    try {
      await $initializeApp(
        onProgress: (progress, message) => initializationProgress.value = (progress: progress, message: message),
        onSuccess: (dependencies) => runApp(
          InheritedDependencies(
            dependencies: dependencies,
            child: const SettingsScope(
              child: App(),
            ),
          ),
        ),
      );
    } catch (error, stackTrace) {
      runApp(AppError(error: error));
      ErrorUtil.logError(error, stackTrace).ignore();
    }
  },
  (error, stackTrace) {
    ErrorUtil.logError(error, stackTrace).ignore();
  },
);
