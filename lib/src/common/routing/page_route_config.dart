// Конфигурация маршрута приложения
import 'package:thread/src/common/log/l.dart';

class PageRouteConfig {
  final bool isProfilePage;
  final bool isHomePage;
  final bool isNoFoundPage;

  PageRouteConfig({this.isProfilePage = false, this.isNoFoundPage = false, this.isHomePage = true});

  // Фабричные методы для различных конфигураций
  static PageRouteConfig profile() {
    l.d('-- AppConfiguration profile start');

    return PageRouteConfig(isProfilePage: true, isHomePage: false, isNoFoundPage: false);
  }

  static PageRouteConfig home() {
    l.d('-- AppConfiguration home start');
    return PageRouteConfig(isHomePage: true, isProfilePage: false, isNoFoundPage: false);
  }

  static PageRouteConfig noFound() {
    l.d('-- AppConfiguration noFound start');
    return PageRouteConfig(isHomePage: false, isProfilePage: false, isNoFoundPage: true);
  }
}
