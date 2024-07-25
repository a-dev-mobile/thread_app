import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';

final l = L('app_back_button_dispatcher');

/// AppBackButtonDispatcher обрабатывает нажатие кнопки "назад".
class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  final RouterDelegate _routerDelegate;

  /// Конструктор, принимающий делегата маршрутизатора.
  AppBackButtonDispatcher(this._routerDelegate) : super();

  @override
  Future<bool> didPopRoute() {
    l.dNoStack('-- didPopRoute start');
    // Метод вызывается, когда нажимается кнопка "назад".
    // Он вызывает метод popRoute у делегата маршрутизатора.
    return _routerDelegate.popRoute();
  }

  @override
  void addCallback(ValueGetter<Future<bool>> callback) {
    l.dNoStack('-- addCallback start');
    // Добавляет callback для обработки нажатия кнопки "назад".
    // Если это первый callback, добавляет наблюдателя.
    if (!hasCallbacks) {
      WidgetsBinding.instance.addObserver(this);
    }
    super.addCallback(callback);
  }

  @override
  void removeCallback(ValueGetter<Future<bool>> callback) {
    l.dNoStack('-- removeCallback start');
    // Удаляет callback для обработки нажатия кнопки "назад".
    // Если больше нет callback, удаляет наблюдателя.
    super.removeCallback(callback);
    if (!hasCallbacks) {
      WidgetsBinding.instance.removeObserver(this);
    }
  }
}
