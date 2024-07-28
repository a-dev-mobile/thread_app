import 'package:flutter/material.dart';
import 'package:thread/src/common/model/dependencies.dart';


import 'package:thread/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:thread/src/feature/settings/widget/settings_scope.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => InheritedDependencies.debug(context),
              child: const Text('Debug InheritedDependencies'),
            ),
            ElevatedButton(
              onPressed: () => SettingsScope.debug(context),
              child: const Text('Debug SettingsScope'),
            ),
          ],
        ),
      ),
    );
  }
}
