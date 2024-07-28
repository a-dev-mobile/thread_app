import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/page_route_config.dart';
import 'package:thread/src/common/routing/route_paths.dart';

final l = L('app_route_information_parser');

class AppRouteInformationParser extends RouteInformationParser<PageRouteConfig> {
  @override
  // 10. Парсинг информации о маршруте в конфигурацию маршрута
  Future<PageRouteConfig> parseRouteInformation(RouteInformation routeInformation) {
    final uri = routeInformation.uri;
    final uri2 = uri.pathSegments;
    var firstSegment = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : RoutePaths.home;

    if (!firstSegment.startsWith('/')) {
      firstSegment = '/$firstSegment';
    }

    l.dNoStack('-- parseRouteInformation start firstSegment = $firstSegment');

    return SynchronousFuture(_getPageConfig(firstSegment));
  }

  @override
  // 11. Восстановление информации о маршруте из конфигурации
  RouteInformation restoreRouteInformation(PageRouteConfig configuration) {
    l.dNoStack('-- restoreRouteInformation start');

    switch (configuration.pageType) {
      case PageType.metricThreadType:
        return RouteInformation(uri: Uri.parse(RoutePaths.metricThreadType));
      case PageType.profile:
        return RouteInformation(uri: Uri.parse(RoutePaths.profile));
      case PageType.home:
        return RouteInformation(uri: Uri.parse(RoutePaths.home));
      default:
        return RouteInformation(uri: Uri.parse(RoutePaths.notFound));
    }
  }

  PageRouteConfig _getPageConfig(String firstSegment) {
    switch (firstSegment) {
      case RoutePaths.metricThreadType:
        return PageRouteConfig.metricThreadType();
      case RoutePaths.profile:
        return PageRouteConfig.profile();
      case RoutePaths.home:
        return PageRouteConfig.home();

      default:
        return PageRouteConfig.notFound();
    }
  }

  @override
  Future<PageRouteConfig> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    // при загрузке один из первых
    l.dNoStack('-- parseRouteInformationWithDependencies start --');
    return parseRouteInformation(routeInformation); // Переиспользуем базовый парсер
  }
}
