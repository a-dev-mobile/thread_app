import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/feature/home/home_screen.dart';
import 'package:thread/src/feature/metric_thread_diameter/metric_thread_diameter_screen.dart';
import 'package:thread/src/feature/metric_thread_type/metric_thread_type_screen.dart';
import 'package:thread/src/feature/no_found_screen/not_found_screen.dart';
import 'package:thread/src/feature/user/user_profile_screen.dart';

final l = L('page_route_config');

/// Перечисление всех типов страниц в приложении
enum PageType {
  home,
  profile,
  notFound,
  metricType,
  metricDiameters,
}

/// Абстрактный класс, содержащий пути для всех страниц
abstract class AppRoutes {
  static const String home = '/';
  static const String profile = '/profile';
  static const String metricType = '/metric/type';
  static const String metricDiameters = '/metric/diameters';
  static const String notFound = '/not-found';
}

/// Класс, отвечающий за предоставление страниц по их конфигурации
class AppPageProvider {
  // Единственный экземпляр класса (синглтон)
  static final AppPageProvider _instance = AppPageProvider._internal();

  // Закрытый конструктор
  AppPageProvider._internal();

  // Фабричный конструктор для получения единственного экземпляра
  factory AppPageProvider() => _instance;

  /// Метод для получения виджета страницы по конфигурации
  static Widget getPage(AppPageRouteConfig config) {
    switch (config.pageType) {
      case PageType.metricDiameters:
        return const MetricDiameterScreen();
      case PageType.metricType:
        return const MetricTypeScreen();
      case PageType.home:
        return const HomeScreen();
      case PageType.notFound:
        return const NotFoundScreen();
      case PageType.profile:
        return const UserProfileScreen();
    }
  }

  /// Метод для получения конфигурации страницы по сегменту пути
  static AppPageRouteConfig getPageConfig(String path) {
    switch (path) {
      case AppRoutes.metricType:
        return AppPageRouteConfig.metricThreadType();
      case AppRoutes.metricDiameters:
        return AppPageRouteConfig.metricDiameters();
      case AppRoutes.profile:
        return AppPageRouteConfig.profile();
      case AppRoutes.home:
        return AppPageRouteConfig.home();
      default:
        return AppPageRouteConfig.notFound();
    }
  }

  /// Метод для восстановления информации о маршруте по конфигурации
  static RouteInformation restoreRouteInformation(AppPageRouteConfig configuration) {
    switch (configuration.pageType) {
      case PageType.metricType:
        return RouteInformation(uri: Uri.parse(AppRoutes.metricType));
      case PageType.metricDiameters:
        return RouteInformation(uri: Uri.parse(AppRoutes.metricDiameters));
      case PageType.profile:
        return RouteInformation(uri: Uri.parse(AppRoutes.profile));
      case PageType.home:
        return RouteInformation(uri: Uri.parse(AppRoutes.home));
      case PageType.notFound:
        return RouteInformation(uri: Uri.parse(AppRoutes.notFound));
    }
  }
}

/// Класс, представляющий конфигурацию маршрута для каждой страницы
class AppPageRouteConfig<T> {
  /// Тип страницы
  final PageType pageType;

  /// Аргументы, передаваемые на страницу
  final T? arguments;

  AppPageRouteConfig({required this.pageType, this.arguments});

  /// Карта предустановленных конфигураций для каждой страницы
  static final Map<PageType, AppPageRouteConfig> _configMap = {
    PageType.metricType: AppPageRouteConfig(pageType: PageType.metricType),
    PageType.metricDiameters: AppPageRouteConfig(pageType: PageType.metricDiameters),
    PageType.home: AppPageRouteConfig(pageType: PageType.home),
    PageType.profile: AppPageRouteConfig(pageType: PageType.profile),
    PageType.notFound: AppPageRouteConfig(pageType: PageType.notFound),
  };

  /// Предустановленные конфигурации для каждой страницы
  static AppPageRouteConfig home<T>({T? arguments}) =>
      AppPageRouteConfig(pageType: PageType.home, arguments: arguments);
  static AppPageRouteConfig metricThreadType<T>({T? arguments}) =>
      AppPageRouteConfig(pageType: PageType.metricType, arguments: arguments);
  static AppPageRouteConfig metricDiameters<T>({T? arguments}) =>
      AppPageRouteConfig(pageType: PageType.metricDiameters, arguments: arguments);
  static AppPageRouteConfig profile<T>({T? arguments}) =>
      AppPageRouteConfig(pageType: PageType.profile, arguments: arguments);
  static AppPageRouteConfig notFound<T>({T? arguments}) =>
      AppPageRouteConfig(pageType: PageType.notFound, arguments: arguments);

  /// Метод для получения конфигурации по типу страницы с аргументами
  static AppPageRouteConfig getConfig(PageType pageType, {dynamic arguments}) {
    return _configMap[pageType]!.copyWith(arguments: arguments);
  }

  /// Метод для копирования конфигурации с новыми аргументами
  AppPageRouteConfig<T> copyWith({T? arguments}) {
    return AppPageRouteConfig(pageType: pageType, arguments: arguments ?? this.arguments);
  }

  /// Метод для преобразования объекта в строку
  @override
  String toString() {
    return 'AppPageRouteConfig(pageType: $pageType, arguments: $arguments)';
  }
}
