import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:thread/src/common/log/log_setup%20copy%202.dart';

import 'package:thread/src/common/routing/page_route_config.dart';
import 'package:thread/src/feature/home/home_route.dart';
import 'package:thread/src/feature/no_found_screen/not_found_route.dart';
import 'package:thread/src/feature/user_profile/user_profile_route.dart';

class AppRouterDelegate extends RouterDelegate<PageRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRouteConfig> {
  late List<Page> _pages;

  @override
  // Метод build создает виджет Navigator, который управляет стеком страниц
  Widget build(BuildContext context) {
    Log.debug('-- build start');
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages), // Список страниц, используемых навигатором
      onPopPage: (route, result) {
        Log.debug('-- build Navigator onPopPage start');

        // Проверка типа маршрута и вывод информации о нём
        if (route is MaterialPageRoute) {
          Log.debug('-- build Navigator onPopPageMaterialPageRoute: ${route.settings.toString()}');
        } else if (route is PageRoute) {
          Log.debug('-- build Navigator onPopPagePageRoute: ${route.settings.name}');
        } else {
          Log.debug('-- build Navigator onPopPageOther Route: ${route.settings.name}');
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
  void pushToProfileRoute() {
    Log.debug('-- goToProfile start');
    _pages.add(UserProfileRoute(routerDelegate: this));
    notifyListeners();
  }

  // Метод goToHome возвращает пользователя на домашнюю страницу, очищая стек страниц
  void goToHomeRoute() {
    Log.debug('-- goToHome start');
    if (_pages.last is HomeRoute) return;
    _pages = [HomeRoute(routerDelegate: this)];
    notifyListeners();
  }

  void pushHomeRoute() {
    Log.debug('-- pushHomeRoute start');
    _pages.add(HomeRoute(routerDelegate: this));

    // if (_pages.last is HomeRoute) return;
    notifyListeners();
  }

  void goToErrorScreen() {
    Log.debug('-- goToErrorScreen start');
    _pages = [NotFoundRoute(routerDelegate: this)];

    notifyListeners();
  }

  void pushToErrorScreen() {
    Log.debug('-- pushToErrorScreen start');

    _pages.add(NotFoundRoute(routerDelegate: this));
    notifyListeners();
  }

  @override
  // Получение ключа навигатора
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  // Установка начального пути маршрута
  Future<void> setInitialRoutePath(PageRouteConfig configuration) {
    Log.debug('-- setInitialRoutePath start --');
    // Инициализация начальной страницы
    _pages = [HomeRoute(routerDelegate: this)];
    return setNewRoutePath(configuration);
  }

  @override
  // Восстановление пути маршрута после восстановления состояния
  Future<void> setRestoredRoutePath(PageRouteConfig configuration) {
    Log.debug('-- setRestoredRoutePath start --');
    return setNewRoutePath(configuration);
  }

  @override
  // Установка нового пути маршрута
  Future<void> setNewRoutePath(PageRouteConfig configuration) async {
    Log.debug('-- setNewRoutePath start');
    // Очищаем стек и добавляем нужную страницу в зависимости от конфигурации
    // _pages.clear();

    if (configuration.isHomePage) {
      return;
    }

    if (configuration.isProfilePage) {
      _pages.add(UserProfileRoute(routerDelegate: this));
    } else if (configuration.isNoFoundPage) {
      _pages.add(NotFoundRoute(routerDelegate: this));
    } else {
      _pages.add(HomeRoute(routerDelegate: this));
    }
    notifyListeners();
  }

  @override
  // Метод popRoute обрабатывает нажатие кнопки "назад"
  Future<bool> popRoute() {
    Log.debug('-- popRoute start --');
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
    Log.debug('-- currentConfiguration get --');
    // Определяем текущую конфигурацию, исходя из последней страницы в стеке
    if (_pages.isNotEmpty) {
      if (_pages.last is UserProfileRoute) {
        return PageRouteConfig.profile();
      } else if (_pages.last is NotFoundRoute) {
        return PageRouteConfig.noFound();
      }
    }
    return PageRouteConfig.home();
  }
}
