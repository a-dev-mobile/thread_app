import 'package:flutter/material.dart';
import 'package:thread/src/common/util/app_zone.dart';
import 'package:thread/src/common/util/error_util.dart';
import 'package:thread/src/common/widget/app.dart';
import 'package:thread/src/common/widget/app_error.dart';
import 'package:thread/src/feature/initialization/data/initialization.dart';
import 'package:thread/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:thread/src/feature/settings/widget/settings_scope.dart';

void main() => appZone(
      () async {
        // Splash screen
        final initializationProgress = ValueNotifier<({int progress, String message})>((progress: 0, message: ''));
        /* runApp(SplashScreen(progress: initializationProgress)); */
        $initializeApp(
          onProgress: (progress, message) => initializationProgress.value = (progress: progress, message: message),
          onSuccess: (dependencies) => runApp(
            InheritedDependencies(
              dependencies: dependencies,
              child: const SettingsScope(
                child: App(),
              ),
            ),
          ),
          onError: (error, stackTrace) {
            runApp(AppError(error: error));
            ErrorUtil.logError(error, stackTrace).ignore();
          },
        ).ignore();
      },
    );
