import 'package:flutter/material.dart';
import 'package:thread/src/common/routing/app_route_information_parser.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';

class AppRouterScope extends InheritedWidget {
  final AppRouterDelegate routerDelegate;
  final AppRouteInformationParser routeInformationParser;

  const AppRouterScope({
    required this.routerDelegate,
    required this.routeInformationParser,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static AppRouterScope of(BuildContext context) {
    final AppRouterScope? result =
        context.dependOnInheritedWidgetOfExactType<AppRouterScope>();
    assert(result != null, 'No AppRouterScope found in context');
    return result!;
  }

  static void debug(BuildContext context) {
    final scope = of(context);
    debugPrint('AppRouterScope holds: \n'
        'AppRouterDelegate: ${scope.routerDelegate.currentConfiguration}\n'
        'AppRouteInformationParser: ${scope.routeInformationParser}');
  }

  @override
  bool updateShouldNotify(AppRouterScope oldWidget) {
    return routerDelegate != oldWidget.routerDelegate ||
           routeInformationParser != oldWidget.routeInformationParser;
  }
}
