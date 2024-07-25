import 'package:thread/src/common/log/l_setup.dart';

final l = L('page_route_config');

enum PageType {
  home,
  profile,
  notFound,

  // Добавьте другие типы страниц здесь
}

class PageRouteConfig<T> {
  final PageType pageType;
  final T? arguments;

  PageRouteConfig({required this.pageType, this.arguments});

  static final Map<PageType, PageRouteConfig> _configMap = {
    PageType.home: PageRouteConfig(pageType: PageType.home),
    PageType.profile: PageRouteConfig(pageType: PageType.profile),
    PageType.notFound: PageRouteConfig(pageType: PageType.notFound),

    // Добавьте другие страницы здесь
  };

  static PageRouteConfig home<T>({T? arguments}) => PageRouteConfig(pageType: PageType.home, arguments: arguments);

  static PageRouteConfig profile<T>({T? arguments}) =>
      PageRouteConfig(pageType: PageType.profile, arguments: arguments);

  static PageRouteConfig notFound<T>({T? arguments}) =>
      PageRouteConfig(pageType: PageType.notFound, arguments: arguments);


  static PageRouteConfig getConfig(PageType pageType, {dynamic arguments}) {
    return _configMap[pageType]!.copyWith(arguments: arguments);
  }

  PageRouteConfig<T> copyWith({T? arguments}) {
    return PageRouteConfig(pageType: pageType, arguments: arguments ?? this.arguments);
  }
}
