// Маршрут для страницы профиля
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/widget/profile/app_router_delegate.dart';
import 'package:thread/src/common/widget/profile/user_profile_screen.dart';

class UserProfileRoute extends Page {
  final AppRouterDelegate routerDelegate;
  const UserProfileRoute({required this.routerDelegate}) : super(key: const ValueKey("UserProfileRoute"));
  @override
  // Отсутствие ключа означает, что каждый раз при создании UserProfileRoute
  // будет создаваться новый экземпляр виджета, что гарантирует обновление данных на странице.
  // Это полезно для случаев, когда данные пользователя могут изменяться и должны обновляться.
  Route createRoute(BuildContext context) {
    l.d('-- UserProfileRoute createRoute start');
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => UserProfilePage(
        routerDelegate: routerDelegate,
      ),
    );
  }
}
