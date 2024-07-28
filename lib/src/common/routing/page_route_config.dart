import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/feature/metric_thread_type/metric_thread_type_screen.dart';

final l = L('page_route_config');

/// Перечисление типов страниц
enum PageType {
  home,
  profile,
  notFound,
  metricThreadType,
}

/// Конфигурация маршрута страницы
class PageRouteConfig<T> {
  /// Тип страницы
  final PageType pageType;

  /// Аргументы, передаваемые на страницу
  final T? arguments;

  PageRouteConfig({required this.pageType, this.arguments});

  /// Карта предустановленных конфигураций для каждой страницы
  static final Map<PageType, PageRouteConfig> _configMap = {
    PageType.metricThreadType: PageRouteConfig(pageType: PageType.metricThreadType),
    PageType.home: PageRouteConfig(pageType: PageType.home),
    PageType.profile: PageRouteConfig(pageType: PageType.profile),
    PageType.notFound: PageRouteConfig(pageType: PageType.notFound),

    // Добавьте другие страницы здесь
  };

  /// Метод для получения конфигурации домашней страницы
  static PageRouteConfig home<T>({T? arguments}) => PageRouteConfig(pageType: PageType.home, arguments: arguments);

  /// Метод для получения конфигурации страницы типа метрики
  static PageRouteConfig metricThreadType<T>({T? arguments}) =>
      PageRouteConfig(pageType: PageType.metricThreadType, arguments: arguments);

  /// Метод для получения конфигурации страницы профиля
  static PageRouteConfig profile<T>({T? arguments}) =>
      PageRouteConfig(pageType: PageType.profile, arguments: arguments);

  /// Метод для получения конфигурации страницы "не найдено"
  static PageRouteConfig notFound<T>({T? arguments}) =>
      PageRouteConfig(pageType: PageType.notFound, arguments: arguments);

  /// Метод для получения конфигурации для указанного типа страницы
  static PageRouteConfig getConfig(PageType pageType, {dynamic arguments}) {
    return _configMap[pageType]!.copyWith(arguments: arguments);
  }

  /// Метод для копирования конфигурации с новыми аргументами
  PageRouteConfig<T> copyWith({T? arguments}) {
    return PageRouteConfig(pageType: pageType, arguments: arguments ?? this.arguments);
  }

  /// Метод для преобразования объекта в строку
  @override
  String toString() {
    return 'PageRouteConfig(pageType: $pageType, arguments: $arguments)';
  }
}
