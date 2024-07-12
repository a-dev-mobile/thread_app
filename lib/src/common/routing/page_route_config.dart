// Конфигурация маршрута приложения
import 'package:thread/src/common/log/l.dart';

class PageRouteConfig {
  final bool isProfilePage;
  final bool isHomePage;

  PageRouteConfig({this.isProfilePage = false, this.isHomePage = true});

  // Фабричные методы для различных конфигураций
  static PageRouteConfig profile() {
    l.d('-- AppConfiguration profile start');

    return PageRouteConfig(isProfilePage: true, isHomePage: false);
  }

  static PageRouteConfig home() {
    l.d('-- AppConfiguration home start');
    return PageRouteConfig(isHomePage: true, isProfilePage: false);
  }
}
