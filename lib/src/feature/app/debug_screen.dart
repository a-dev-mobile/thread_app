import 'package:flutter/material.dart';

import 'package:thread/src/feature/initialization/widget/inherited_dependencies.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameAppBar = 'Debug Screen';
    String nameBtn = 'Debug InheritedDependencies';
    return Scaffold(
      appBar: AppBar(
        title: Text(nameAppBar),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
              InheritedDependencies.debug(context);
              },
              child: Text(nameBtn),
            ),
            ElevatedButton(
              onPressed: () {
                // Define your onPressed function here
              },
              child: Text('Button'),
            ),
// add placeholder for btn
            const Button(),
            // and text
            const Text('Modified Text'),
            //  ElevatedButton(

            // ElevatedButton(
            // onPressed: () => SettingsScope.debug(context),
            // child: const Text('Debug SettingsScope'),
            // ),
          ],
        ),
      ),
    );
  }
}

// виджет заглушку для кнопки
class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Define your onPressed function here
      },
      child: Text('Button'),
    );
  }
}
