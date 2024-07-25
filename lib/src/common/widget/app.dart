import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/localization/localization.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/routing/app_back_button_dispatcher.dart';
import 'package:thread/src/common/routing/app_route_information_parser.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/common/routing/app_router_scope.dart';
import 'package:thread/src/feature/settings/widget/settings_scope.dart';
final l = L('App');
/// Виджет приложения.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  // 2. Построение виджета приложения с использованием MaterialApp.router
  Widget build(BuildContext context) {
    l.dNoStack('-- build start');

    final dependencies = Dependencies.of(context);

    return SettingsScope(
      child: Builder(
        builder: (context) {
          l.dNoStack('-- SettingsScope build called');
          return MaterialApp.router(
            title: 'Application',
            debugShowCheckedModeBanner: !Config.environment.isProduction,
            localizationsDelegates: const <LocalizationsDelegate<Object?>>[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              Localization.delegate,
            ],
            supportedLocales: Localization.supportedLocales,
            routerDelegate: dependencies.routerDelegate,
            routeInformationParser: dependencies.routeInformationParser,
            backButtonDispatcher: AppBackButtonDispatcher(dependencies.routerDelegate),
            theme: SettingsScope.themeOf(context),
          );
        },
      ),
    );
  }
}
