import 'package:flutter/material.dart';
import 'package:thread/src/feature/settings/widget/inherited_settings_scope.dart';
import 'package:thread/src/feature/settings/widget/theme_manager.dart';

class SettingsScope extends StatefulWidget {
  const SettingsScope(visualDebugProvider, {
    required this.child,
    super.key,
  });

  final Widget child;

  static ThemeData themeOf(BuildContext context, {bool listen = true}) =>
      InheritedSettingsScope.of(context, listen: listen).scope.theme;

  static SettingsScopeState of(BuildContext context, {bool listen = true}) =>
      InheritedSettingsScope.of(context, listen: listen).scope;

  @override
  State<SettingsScope> createState() => SettingsScopeState();
}

class SettingsScopeState extends State<SettingsScope> {
  ThemeData _theme = ThemeManager.buildTheme(ThemeData.light());

  ThemeData get theme => _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness != _theme.brightness) {
      _theme = ThemeManager.buildTheme(
        brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light(),
      );
    }
  }

  void toggleTheme() {
    setState(() {
      _theme = _theme.brightness == Brightness.dark
          ? ThemeManager.buildTheme(ThemeData.light())
          : ThemeManager.buildTheme(ThemeData.dark());
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedSettingsScope(
      scope: this,
      theme: _theme,
      child: widget.child,
    );
  }
}
