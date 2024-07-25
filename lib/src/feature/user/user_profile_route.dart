// Маршрут для страницы профиля
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';

import 'package:thread/src/feature/user/user_profile_screen.dart';

final l = L('UserProfileRoute');

class UserProfileRoute extends Page {


  @override
  final key = const ValueKey("user_profile_route");

  const UserProfileRoute() : super(key: const ValueKey("UserProfileRoute"));
  @override
  // Отсутствие ключа означает, что каждый раз при создании UserProfileRoute
  // будет создаваться новый экземпляр виджета, что гарантирует обновление данных на странице.
  // Это полезно для случаев, когда данные пользователя могут изменяться и должны обновляться.
  Route createRoute(BuildContext context) {
    l.dNoStack('-- createRoute start');
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => const UserProfileScreen(
   
      ),
    );
  }
}
