import 'dart:async';

import 'package:flutter/material.dart';

/// {@template app_lifecycle_manager}
/// AppLifecycleManager widget
/// {@endtemplate}
class AppLifecycleManager extends StatefulWidget {
  /// {@macro app_lifecycle_manager}
  const AppLifecycleManager({required this.child, super.key});
  final Widget child;

  @override
  State<AppLifecycleManager> createState() => _AppLifecycleManagerState();
}

/// State for widget AppLifecycleManager
class _AppLifecycleManagerState extends State<AppLifecycleManager> with WidgetsBindingObserver {
  /* #region Lifecycle */

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    // final client = context.read<ApiClient>();

    switch (state) {
      case AppLifecycleState.resumed:
      
      // unawaited(client.sendStartApp());
      case AppLifecycleState.paused:
      // unawaited(client.sendStopApp());


      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
    }
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
