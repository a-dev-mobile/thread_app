// Конфигурация маршрута приложения
import 'package:thread/src/common/log/l.dart';

class AppConfiguration {
  final bool isProfilePage;
  final bool isHomePage;

  AppConfiguration({this.isProfilePage = false, this.isHomePage = true});

  // Фабричные методы для различных конфигураций
  static AppConfiguration profile() {
       l.d('-- AppConfiguration profile start');

    return AppConfiguration(isProfilePage: true, isHomePage: false);
  }

  static AppConfiguration home() {
           l.d('-- AppConfiguration home start');
    return AppConfiguration(isHomePage: true, isProfilePage: false);
  }
}
