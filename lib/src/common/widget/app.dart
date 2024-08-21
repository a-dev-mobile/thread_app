import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thread/src/common/localization/localization.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/routing/app_back_button_dispatcher.dart';
import 'package:thread/src/common/routing/app_route_information_parser.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/feature/visual_debug/visual_debug_controller.dart';
import 'package:thread/src/overlay/overlay_widget.dart';

final _l = L('App');

/// Виджет приложения.
class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouterDelegate _routerDelegate;
  late final AppRouteInformationParser _routeInformationParser;
  late final Dependencies _dependencies;
  late final VisualDebugController _visualDebugController;

  @override
  void initState() {
    super.initState();
    _dependencies = Dependencies.of(context);
    _routerDelegate = _dependencies.routerDelegate;
    _routeInformationParser = _dependencies.routeInformationParser;
    _visualDebugController = _dependencies.visualDebugController;

    _visualDebugController.addListener(_onVisualDebugChange);
  }

  @override
  void dispose() {
    _visualDebugController.removeListener(_onVisualDebugChange);
    super.dispose();
  }

  void _onVisualDebugChange() {
    setState(() {});
  }

  @override
  // 2. Построение виджета приложения с использованием Router
  Widget build(BuildContext context) {
    _l.dNoStack('-- build start');
    debugRepaintRainbowEnabled = _visualDebugController.state.isShowRepaintRainbow;
    debugPaintSizeEnabled = _visualDebugController.state.isShowPaintSizeEnabled;

    return MaterialApp.router(
      title: 'Application',
      debugShowCheckedModeBanner: _visualDebugController.state.isDebugShowChecked,
      localizationsDelegates: const <LocalizationsDelegate<Object?>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        Localization.delegate,
      ],
      supportedLocales: Localization.supportedLocales,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      backButtonDispatcher: AppBackButtonDispatcher(_routerDelegate),
      theme: ThemeData.light(),
      showPerformanceOverlay: kIsWeb ? false : _visualDebugController.state.isShowPerformanceOverlay,
      builder: (context, child) {
        return OverlayWidget(child: child!);
      },
    );
  }
}
