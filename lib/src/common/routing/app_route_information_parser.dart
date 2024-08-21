import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

final _l = L('app_route_information_parser');

class AppRouteInformationParser extends RouteInformationParser<AppPageRouteConfig> {
  @override
  // 10. Парсинг информации о маршруте в конфигурацию маршрута
  Future<AppPageRouteConfig> parseRouteInformation(RouteInformation routeInformation) {
    final uri = routeInformation.uri;
    var path = uri.pathSegments.isNotEmpty ? uri.path : AppRoutes.home;

    // if (!path.startsWith('/')) {
    //   path = '/$path';
    // }

    _l.dNoStack('-- parseRouteInformation start path = $path');

    return SynchronousFuture(AppPageProvider.getPageConfig(path));
  }

  @override
  // 11. Восстановление информации о маршруте из конфигурации
  RouteInformation restoreRouteInformation(AppPageRouteConfig configuration) {
    _l.dNoStack('-- restoreRouteInformation start');
    return AppPageProvider.restoreRouteInformation(configuration);
  }

  @override
  Future<AppPageRouteConfig> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    // при загрузке один из первых
    _l.dNoStack('-- parseRouteInformationWithDependencies start --');
    return parseRouteInformation(routeInformation); // Переиспользуем базовый парсер
  }
}
