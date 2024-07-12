import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/routing/page_route_config.dart';
import 'package:thread/src/feature/home/home_route.dart';
import 'package:thread/src/feature/no_found_screen/not_found_route.dart';
import 'package:thread/src/feature/user_profile/user_profile_route.dart';

class AppRouterDelegate extends RouterDelegate<PageRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRouteConfig> {
  late List<Page> _pages;

  // Конструктор класса AppRouterDelegate
  AppRouterDelegate() {
    l.d('-- AppRouterDelegate init start');
    _pages = [HomeRoute(routerDelegate: this)]; // Инициализация начальной страницы
  }

  @override
  // Метод build создает виджет Navigator, который управляет стеком страниц
  Widget build(BuildContext context) {
    l.d('-- AppRouterDelegate build start');
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages), // Список страниц, используемых навигатором
      onPopPage: (route, result) {
        l.d('-- AppRouterDelegate build Navigator onPopPage start');

        // Проверка типа маршрута и вывод информации о нём
        if (route is MaterialPageRoute) {
          l.d('-- AppRouterDelegate build Navigator onPopPageMaterialPageRoute: ${route.settings.toString()}');
        } else if (route is PageRoute) {
          l.d('-- AppRouterDelegate build Navigator onPopPagePageRoute: ${route.settings.name}');
        } else {
          l.d('-- AppRouterDelegate build Navigator onPopPageOther Route: ${route.settings.name}');
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
    l.d('-- AppRouterDelegate goToProfile start');
    _pages.add(UserProfileRoute(routerDelegate: this));
    notifyListeners();
  }

  // Метод goToHome возвращает пользователя на домашнюю страницу, очищая стек страниц
  void goToHomeRoute() {
    l.d('-- AppRouterDelegate goToHome start');
    _pages = [HomeRoute(routerDelegate: this)];
    notifyListeners();
  }

  void pushHomeRoute() {
    l.d('-- AppRouterDelegate addHome start');
    _pages.add(HomeRoute(routerDelegate: this));
    notifyListeners();
  }

  void goToErrorScreen() {
    l.d('-- AppRouterDelegate goToErrorScreen start');
    _pages = [NotFoundRoute(routerDelegate: this)];

    notifyListeners();
  }

  void pushToErrorScreen() {
    l.d('-- AppRouterDelegate pushToErrorScreen start');

    _pages.add(NotFoundRoute(routerDelegate: this));
    notifyListeners();
  }

  @override
  // Получение ключа навигатора
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  // Установка начального пути маршрута
  Future<void> setInitialRoutePath(PageRouteConfig configuration) {
    l.d('-- AppRouterDelegate setInitialRoutePath start --');
    return setNewRoutePath(configuration);
  }

  @override
  // Восстановление пути маршрута после восстановления состояния
  Future<void> setRestoredRoutePath(PageRouteConfig configuration) {
    l.d('-- AppRouterDelegate setRestoredRoutePath start --');
    return setNewRoutePath(configuration);
  }

  @override
  // Установка нового пути маршрута
  Future<void> setNewRoutePath(PageRouteConfig configuration) async {
    l.d('-- AppRouterDelegate setNewRoutePath start');
    if (configuration.isProfilePage) {
      _pages.clear();
      _pages.add(UserProfileRoute(routerDelegate: this));
    } else {
      _pages.clear();
      _pages.add(HomeRoute(routerDelegate: this));
    }
    notifyListeners();
  }

  @override
  // Метод popRoute обрабатывает нажатие кнопки "назад"
  Future<bool> popRoute() {
    l.d('-- AppRouterDelegate popRoute start --');
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
    l.d('-- AppRouterDelegate currentConfiguration get --');
    if (_pages.isNotEmpty && _pages.last is UserProfileRoute) {
      return PageRouteConfig.profile();
    }
    return PageRouteConfig.home();
  }
}
