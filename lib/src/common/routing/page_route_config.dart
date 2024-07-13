
import 'package:thread/src/common/log/log_setup%20copy%202.dart';



class PageRouteConfig {
  final bool isProfilePage;
  final bool isHomePage;
  final bool isNoFoundPage;

  PageRouteConfig({this.isProfilePage = false, this.isNoFoundPage = false, this.isHomePage = true});

  // Фабричные методы для различных конфигураций
  static PageRouteConfig profile() {
     Log.debug('-- profile start');

    return PageRouteConfig(isProfilePage: true, isHomePage: false, isNoFoundPage: false);
  }

  static PageRouteConfig home() {
     Log.debug('-- home start');
    return PageRouteConfig(isHomePage: true, isProfilePage: false, isNoFoundPage: false);
  }

  static PageRouteConfig noFound() {
     Log.debug('-- noFound start');
    return PageRouteConfig(isHomePage: false, isProfilePage: false, isNoFoundPage: true);
  }
}
