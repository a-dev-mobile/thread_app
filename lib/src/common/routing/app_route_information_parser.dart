import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

final l = L('AppRouteInformationParser');

class RoutePaths {
  static const String metricThread = 'metric-thread';
  static const String profile = 'profile';
  static const String home = '';
  static const String notFound = 'notfound';
}

class AppRouteInformationParser extends RouteInformationParser<PageRouteConfig> {
  @override
  // 10. Парсинг информации о маршруте в конфигурацию маршрута
  Future<PageRouteConfig> parseRouteInformation(RouteInformation routeInformation) {
    final uri = routeInformation.uri;
    final uri2 = uri.pathSegments;
    final firstSegment = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : RoutePaths.metricThread;
    l.dNoStack('-- parseRouteInformation start firstSegment = $firstSegment');

    return SynchronousFuture(getPageConfig(firstSegment));
  }

  @override
  // 11. Восстановление информации о маршруте из конфигурации
  RouteInformation restoreRouteInformation(PageRouteConfig configuration) {
    l.dNoStack('-- restoreRouteInformation start');

    switch (configuration.pageType) {
      case PageType.metricThreadType:
        return RouteInformation(uri: Uri.parse(RoutePaths.metricThread));
      case PageType.profile:
        return RouteInformation(uri: Uri.parse(RoutePaths.profile));
      case PageType.notFound:
        return RouteInformation(uri: Uri.parse(RoutePaths.notFound));
      case PageType.home:
      default:
        return RouteInformation(uri: Uri.parse('/'));
    }
  }

  PageRouteConfig getPageConfig(String firstSegment) {
    switch (firstSegment) {
      case RoutePaths.metricThread:
        return PageRouteConfig.metricThreadType();
      case RoutePaths.profile:
        return PageRouteConfig.profile();
      // Добавьте другие страницы здесь
      default:
        return PageRouteConfig.notFound();
    }
  }

  @override
  Future<PageRouteConfig> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    l.dNoStack('-- parseRouteInformationWithDependencies start --');
    return parseRouteInformation(routeInformation); // Переиспользуем базовый парсер
  }
}
