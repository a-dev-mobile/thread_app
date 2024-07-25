import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/page_route_config.dart';
import 'package:thread/src/feature/home/home_route.dart';
import 'package:thread/src/feature/home/home_screen.dart';
import 'package:thread/src/feature/no_found_screen/not_found_route.dart';
import 'package:thread/src/feature/no_found_screen/not_found_screen.dart';
import 'package:thread/src/feature/user/user_profile_route.dart';
import 'package:thread/src/feature/user/user_profile_screen.dart';

final l = L('AppRouterDelegate');

class AppRouterDelegate extends RouterDelegate<PageRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRouteConfig> {
  List<Page> _pages = [];

  @override
  // Метод build создает виджет Navigator, который управляет стеком страниц
  Widget build(BuildContext context) {
    l.dNoStack('-- build start');
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages), // Список страниц, используемых навигатором
      onPopPage: (route, result) {
        l.dNoStack('-- build Navigator onPopPage start');

        // Проверка типа маршрута и вывод информации о нём
        if (route is MaterialPageRoute) {
          l.dNoStack('-- build Navigator onPopPageMaterialPageRoute: ${route.settings.toString()}');
        } else if (route is PageRoute) {
          l.dNoStack('-- build Navigator onPopPagePageRoute: ${route.settings.name}');
        } else {
          l.dNoStack('-- build Navigator onPopPageOther Route: ${route.settings.name}');
        }

        if (!route.didPop(result)) {
          return false;
        }
        _pages.removeLast(); // Удаление последней страницы при возврате
        notifyListeners();
        return true;
      },
    );
  }

  // Метод goToProfile добавляет страницу профиля в стек навигатора
  void push<T>(PageType pageType, {T? arguments}) {
    final config = PageRouteConfig<T>(pageType: pageType, arguments: arguments);
    _pages.add(MaterialPage(
      key: ValueKey(config.pageType),
      child: _getPageWidget(config),
    ));
    notifyListeners();
  }

  void replace<T>(PageType pageType, {T? arguments}) {
    final config = PageRouteConfig<T>(pageType: pageType, arguments: arguments);
    _pages = [
      MaterialPage(
        key: ValueKey(config.pageType),
        child: _getPageWidget(config),
      )
    ];
    notifyListeners();
  }

  Widget _getPageWidget(PageRouteConfig config) {
    switch (config.pageType) {
      case PageType.home:
        return const HomeScreen();

      case PageType.notFound:
        return const NotFoundScreen();

      case PageType.profile:
        return const UserProfileScreen();
      // Добавьте другие страницы здесь
      default:
        return NotFoundScreen();
    }
  }

  @override
  // Получение ключа навигатора
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  // Установка начального пути маршрута
  Future<void> setInitialRoutePath(PageRouteConfig configuration) {
    l.dNoStack('-- setInitialRoutePath start --');
    // Инициализация начальной страницы
    _pages = [
      MaterialPage(
        key: ValueKey(configuration.pageType),
        child: _getPageWidget(configuration),
      ),
    ];
    return setNewRoutePath(configuration);
  }

  @override
  // Восстановление пути маршрута после восстановления состояния
  Future<void> setRestoredRoutePath(PageRouteConfig configuration) {
    l.dNoStack('-- setRestoredRoutePath start --');
    return setNewRoutePath(configuration);
  }

  @override
  // Установка нового пути маршрута
  Future<void> setNewRoutePath(PageRouteConfig configuration) async {
    l.dNoStack('-- setNewRoutePath start');

    _pages.clear();
    _pages.add(MaterialPage(
      key: ValueKey(configuration.pageType),
      child: _getPageWidget(configuration),
    ));
    notifyListeners();
  }

  @override
  // Метод popRoute обрабатывает нажатие кнопки "назад"
  Future<bool> popRoute() {
    l.dNoStack('-- popRoute start --');
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  // Получение текущей конфигурации маршрута
  PageRouteConfig? get currentConfiguration {
    l.dNoStack('-- currentConfiguration get --');
    // Определяем текущую конфигурацию, исходя из последней страницы в стеке
    if (_pages.isNotEmpty) {
      final config = _pages.last.arguments as PageRouteConfig?;
      return config;
    }
    return PageRouteConfig.home();
  }
}
