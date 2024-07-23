import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/localization/localization.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/app_back_button_dispatcher.dart';
import 'package:thread/src/common/routing/app_route_information_parser.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';

/// Виджет приложения.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // 1. Инициализация делегата маршрутизатора и парсера информации о маршруте
  final _routerDelegate = AppRouterDelegate();
  final _routeInformationParser = AppRouteInformationParser();

  @override
  // 2. Построение виджета приложения с использованием MaterialApp.router
  Widget build(BuildContext context) {
    L.d('-- build start');

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
      routerDelegate: _routerDelegate, // 3. Назначение делегата маршрутизатора
      routeInformationParser: _routeInformationParser, // 4. Назначение парсера информации о маршруте
      backButtonDispatcher: AppBackButtonDispatcher(_routerDelegate),
      theme: ThemeData.dark(),
    );
  }
}
