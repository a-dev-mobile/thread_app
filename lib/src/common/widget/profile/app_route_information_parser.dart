import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/widget/profile/app_configuration.dart';

class AppRouteInformationParser extends RouteInformationParser<AppConfiguration> {
  @override
  // 10. Парсинг информации о маршруте в конфигурацию маршрута
  Future<AppConfiguration> parseRouteInformation(RouteInformation routeInformation) {
    l.d('-- AppRouteInformationParser parseRouteInformation start');
    final uri = routeInformation.uri;
    // Если URI содержит сегмент 'profile', создаётся конфигурация профиля
    if (uri.pathSegments.length == 1 && uri.pathSegments.first == 'profile') {
      return SynchronousFuture(AppConfiguration.profile());
    }
    // По умолчанию создаётся конфигурация домашней страницы
    return SynchronousFuture(AppConfiguration.home());
  }

  @override
  // 11. Восстановление информации о маршруте из конфигурации
  RouteInformation restoreRouteInformation(AppConfiguration configuration) {
        l.d('-- AppRouteInformationParser restoreRouteInformation start');
    if (configuration.isProfilePage) {
      return RouteInformation(uri: Uri.parse('/profile'));
    }
    return RouteInformation(uri: Uri.parse('/'));
  }


    // Тут можно использовать контекст для получения дополнительной информации или зависимостей
    @override
  Future<AppConfiguration> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    l.d('-- AppRouteInformationParser parseRouteInformationWithDependencies start --');
    return parseRouteInformation(routeInformation); // Переиспользуем базовый парсер
  }

}
