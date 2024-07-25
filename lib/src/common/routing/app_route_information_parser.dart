import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

final l = L('AppRouteInformationParser');

class AppRouteInformationParser extends RouteInformationParser<PageRouteConfig> {
  @override
  // 10. Парсинг информации о маршруте в конфигурацию маршрута
  Future<PageRouteConfig> parseRouteInformation(RouteInformation routeInformation) {
    l.dNoStack('-- parseRouteInformation start');
    final uri = routeInformation.uri;
    // Если URI содержит сегмент 'profile', создаётся конфигурация профиля
    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(PageRouteConfig.home());
    }
    switch (uri.pathSegments.first) {
      case 'profile':
        return SynchronousFuture(PageRouteConfig.profile());
      // Добавьте другие страницы здесь
      default:
        return SynchronousFuture(PageRouteConfig.notFound());
    }
  }

  @override
  // 11. Восстановление информации о маршруте из конфигурации
  RouteInformation restoreRouteInformation(PageRouteConfig configuration) {
    l.dNoStack('-- restoreRouteInformation start');

    switch (configuration.pageType) {
      case PageType.profile:
        return RouteInformation(uri: Uri.parse('/profile'));

      // Добавьте другие страницы здесь
      case PageType.notFound:
        return RouteInformation(uri: Uri.parse('/notfound'));
      case PageType.home:
      default:
        return RouteInformation(uri: Uri.parse('/'));
    }
  }

  // Тут можно использовать контекст для получения дополнительной информации или зависимостей
  @override
  Future<PageRouteConfig> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    l.dNoStack('-- parseRouteInformationWithDependencies start --');
    return parseRouteInformation(routeInformation); // Переиспользуем базовый парсер
  }
}
