// lib\src\common\widget\profile\home_route.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart'; // Добавьте этот импорт
import 'package:thread/src/feature/home/home_screen.dart';

final l = L('HomeRoute');

class HomeRoute extends Page {
  // Использование ValueKey позволяет Flutter идентифицировать и переиспользовать
  // виджет HomeRoute при перестроении UI, что эффективно сохраняет состояние страницы.
  const HomeRoute() : super(key: const ValueKey('HomeRoute'));

  @override
  // 12. Создание маршрута для домашней страницы
  Route createRoute(BuildContext context) {
    l.dNoStack('-- createRoute start');
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => const HomeScreen(),
    );
  }
}
