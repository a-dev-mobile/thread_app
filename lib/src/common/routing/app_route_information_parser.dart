import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

class AppRouteInformationParser extends RouteInformationParser<PageRouteConfig> {
  @override
  // 10. Парсинг информации о маршруте в конфигурацию маршрута
  Future<PageRouteConfig> parseRouteInformation(RouteInformation routeInformation) {
    l.d('-- AppRouteInformationParser parseRouteInformation start');
    final uri = routeInformation.uri;
    // Если URI содержит сегмент 'profile', создаётся конфигурация профиля
    if (uri.pathSegments.length == 1 && uri.pathSegments.first == 'profile') {
      return SynchronousFuture(PageRouteConfig.profile());
    }
    // По умолчанию создаётся конфигурация домашней страницы
    return SynchronousFuture(PageRouteConfig.home());
  }

  @override
  // 11. Восстановление информации о маршруте из конфигурации
  RouteInformation restoreRouteInformation(PageRouteConfig configuration) {
    l.d('-- AppRouteInformationParser restoreRouteInformation start');
    if (configuration.isProfilePage) {
      return RouteInformation(uri: Uri.parse('/profile'));
    }
    if (configuration.isNoFoundPage) {
      return RouteInformation(uri: Uri.parse('/nofound'));
    }
    return RouteInformation(uri: Uri.parse('/'));
  }

  // Тут можно использовать контекст для получения дополнительной информации или зависимостей
  @override
  Future<PageRouteConfig> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    l.d('-- AppRouteInformationParser parseRouteInformationWithDependencies start --');
    return parseRouteInformation(routeInformation); // Переиспользуем базовый парсер
  }
}
