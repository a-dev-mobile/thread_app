import 'package:thread/src/common/log/l_setup.dart';

class PageRouteConfig {
  final bool isProfilePage;
  final bool isHomePage;
  final bool isNoFoundPage;

  PageRouteConfig({this.isProfilePage = false, this.isNoFoundPage = false, this.isHomePage = true});

  // Фабричные методы для различных конфигураций
  static PageRouteConfig profile() {
    L.d('-- profile start');

    return PageRouteConfig(isProfilePage: true, isHomePage: false, isNoFoundPage: false);
  }

  static PageRouteConfig home() {
    L.d('-- home start');
    return PageRouteConfig(isHomePage: true, isProfilePage: false, isNoFoundPage: false);
  }

  static PageRouteConfig noFound() {
    L.d('-- noFound start');
    return PageRouteConfig(isHomePage: false, isProfilePage: false, isNoFoundPage: true);
  }
}
