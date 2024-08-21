import 'package:flutter/material.dart';
import 'settings_scope.dart';

class InheritedSettingsScope extends InheritedWidget {
  const InheritedSettingsScope({
    required this.scope,
    required this.theme,
    required super.child,
  });

  final SettingsScopeState scope;
  final ThemeData theme;

  static InheritedSettingsScope? maybeOf(BuildContext context, {bool listen = true}) => listen
      ? context.dependOnInheritedWidgetOfExactType<InheritedSettingsScope>()
      : context.getInheritedWidgetOfExactType<InheritedSettingsScope>();

  static InheritedSettingsScope of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget of the exact type',
        'out_of_scope',
      );

  @override
  bool updateShouldNotify(covariant InheritedSettingsScope oldWidget) => theme != oldWidget.theme;
}
