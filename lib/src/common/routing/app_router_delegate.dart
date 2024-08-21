import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

final _l = L('app_router_delegate');

class AppRouterDelegate extends RouterDelegate<AppPageRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPageRouteConfig> {
  List<Page> _pages = [];
  AppPageRouteConfig? _currentConfiguration;

  @override
  // Метод build создает виджет Navigator, который управляет стеком страниц
  Widget build(BuildContext context) {
    _l.dNoStack('-- build start');
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages), // Список страниц, используемых навигатором
      onPopPage: (route, result) {
        _l.dNoStack('-- build Navigator onPopPage start');

        // Проверка типа маршрута и вывод информации о нём
        if (route is MaterialPageRoute) {
          _l.dNoStack('-- build Navigator onPopPageMaterialPageRoute: ${route.settings.toString()}');
        } else if (route is PageRoute) {
          _l.dNoStack('-- build Navigator onPopPagePageRoute: ${route.settings.name}');
        } else {
          _l.dNoStack('-- build Navigator onPopPageOther Route: ${route.settings.name}');
        }

        if (!route.didPop(result)) {
          return false;
        }
        _pages.removeLast(); // Удаление последней страницы при возврате
        if (_pages.isNotEmpty) {
          final lastPage = _pages.last;
          if (lastPage is MaterialPage && lastPage.arguments is AppPageRouteConfig) {
            _updateCurrentConfiguration(lastPage.arguments as AppPageRouteConfig);
          }
        }
        notifyListeners();
        return true;
      },
    );
  }

  // Метод goToProfile добавляет страницу профиля в стек навигатора
  void push<T>(PageType pageType, {T? arguments}) {
    final config = AppPageRouteConfig<T>(pageType: pageType, arguments: arguments);
    _pages.add(
      MaterialPage(
        key: ValueKey(config.pageType),
        child: AppPageProvider.getPage(config),
        arguments: config,
      ),
    );
    _updateCurrentConfiguration(config);
  }

  void replace<T>(PageType pageType, {T? arguments}) {
    final config = AppPageRouteConfig<T>(pageType: pageType, arguments: arguments);
    _pages = [
      MaterialPage(
        key: ValueKey(config.pageType),
        child: AppPageProvider.getPage(config),
        arguments: config,
      )
    ];
    _updateCurrentConfiguration(config);
  }

  void _updateCurrentConfiguration(AppPageRouteConfig config) {
    _currentConfiguration = config;
    notifyListeners();
  }

  @override
  // Получение ключа навигатора
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  // Установка начального пути маршрута
  Future<void> setInitialRoutePath(AppPageRouteConfig configuration) async {
    _l.dNoStack('-- setInitialRoutePath start --');
    // Инициализация начальной страницы
    _pages = [
      MaterialPage(
        key: ValueKey(configuration.pageType),
        child: AppPageProvider.getPage(configuration),
        arguments: configuration,
      ),
    ];
    _updateCurrentConfiguration(configuration);
    await setNewRoutePath(configuration);
  }

  @override
  // Восстановление пути маршрута после восстановления состояния
  Future<void> setRestoredRoutePath(AppPageRouteConfig configuration) {
    _l.dNoStack('-- setRestoredRoutePath start --');
    return setNewRoutePath(configuration);
  }

  @override
  // Установка нового пути маршрута
  Future<void> setNewRoutePath(AppPageRouteConfig configuration) async {
    _l.dNoStack('-- setNewRoutePath start');

    _pages = [
      MaterialPage(
        key: ValueKey(configuration.pageType),
        child: AppPageProvider.getPage(configuration),
        arguments: configuration,
      ),
    ];
    _updateCurrentConfiguration(configuration);
  }

  @override
  // Метод popRoute обрабатывает нажатие кнопки "назад"
  Future<bool> popRoute() {
    _l.dNoStack('-- popRoute start --');
    if (_pages.length > 1) {
      _pages.removeLast();
      if (_pages.isNotEmpty) {
        final lastPage = _pages.last;
        if (lastPage is MaterialPage && lastPage.arguments is AppPageRouteConfig) {
          _updateCurrentConfiguration(lastPage.arguments as AppPageRouteConfig);
        }
      }
      notifyListeners();
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  // Получение текущей конфигурации маршрута
  AppPageRouteConfig? get currentConfiguration {
    _l.dNoStack('-- currentConfiguration start --${_currentConfiguration?.pageType.name}');

    return _currentConfiguration;
  }
}
