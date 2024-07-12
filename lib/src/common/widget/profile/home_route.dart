// lib\src\common\widget\profile\home_route.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/widget/profile/home_screen.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart'; // Добавьте этот импорт

class HomeRoute extends Page {
  final AppRouterDelegate routerDelegate;

  // Использование ValueKey позволяет Flutter идентифицировать и переиспользовать
  // виджет HomeRoute при перестроении UI, что эффективно сохраняет состояние страницы.
  const HomeRoute({required this.routerDelegate}) : super(key: const ValueKey('HomeRoute'));

  @override
  // 12. Создание маршрута для домашней страницы
  Route createRoute(BuildContext context) {
        l.d('-- HomeRoute createRoute start');
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => HomeScreen(
        routerDelegate: routerDelegate,
        title: 'Home',
      ),
    );
  }
}
