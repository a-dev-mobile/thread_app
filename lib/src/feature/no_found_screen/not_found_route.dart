import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';

import 'package:thread/src/common/widget/common_actions.dart';
import 'package:thread/src/feature/no_found_screen/not_found_screen.dart';

class NotFoundRoute extends Page {
  final AppRouterDelegate routerDelegate;
  const NotFoundRoute({required this.routerDelegate}) : super(key: const ValueKey('NotFoundRoute'));
  @override
  Route createRoute(BuildContext context) {
    l.d('-- NotFoundRoute createRoute start');
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => const NotFoundScreen(
        title: 'test no found',
        message: 'test test test test test test test test test test test test test test test test test test test test ',
      ),
    );
  }
}
