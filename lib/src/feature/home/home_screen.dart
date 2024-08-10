// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/routing/page_route_config.dart';
import 'package:thread/src/feature/app/controller/app_controller.dart';
import 'package:thread/src/feature/app/model/app_env.dart';
import 'package:thread/src/feature/settings/widget/settings_scope.dart';

final l = L('home_screen');

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  // 13. Построение пользовательского интерфейса для домашней страницы
  Widget build(BuildContext context) {
    l.dNoStack('-- build start');

    final appController = Dependencies.of(context).appController;
    final appRouterDelegate = Dependencies.of(context).routerDelegate;
    final project = const AppState().appEnv;
    switch (project) {
      case AppEnvDev():
        l.d('dev');
        l.d(project.apiBaseUrl);
      case AppEnvProd():
        l.d('prod');
        l.d(project.apiBaseUrl);

      // ProjectDev(:final name) => print('Person $name'),
      // ProjectProd(:final name) => print('City ($name)'),
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '${Config.maxScreenLayoutWidth}',
            ),
            ElevatedButton(
              onPressed: () => appRouterDelegate.push(PageType.metricType),
              child: const Text('добавить страницу резьбы'),
            ),
            ElevatedButton(
              onPressed: () => appRouterDelegate.replace(PageType.metricType),
              child: const Text('Перейти страницу резьбы'),
            ),
            ElevatedButton(
              onPressed: () {
                SettingsScope.of(context).toggleTheme();
              },
              child: const Text("Change Theme"),
            ),
            ElevatedButton(
              onPressed: () => appRouterDelegate.push(PageType.profile),
              child: const Text('добавить страницу профиля'),
            ),
            ElevatedButton(
              onPressed: () => appRouterDelegate.replace(PageType.notFound),
              child: const Text('Перейти на страницу ошибки'),
            ),
            ElevatedButton(
              onPressed: () => appRouterDelegate.replace(PageType.home),
              child: const Text('Перейти на главную страницу'),
            ),
            ElevatedButton(
              onPressed: () => appRouterDelegate.push(PageType.home),
              child: const Text('добавить главную страницу'),
            ),
            //
            ElevatedButton(
              onPressed: () {
                appController.toggleDebugButton();
              },
              child: const Text("Toggle toggleDebugButton"),
            ),
            ElevatedButton(
              onPressed: () {
                appController.toggleShowPerformanceOverlay();
              },
              child: const Text("Toggle toggleShowPerformanceOverlay"),
            ),
            ElevatedButton(
              onPressed: () {
                appController.toggleRepaintRainbow();
              },
              child: const Text("Toggle Repaint Rainbow"),
            ),
            ElevatedButton(
              onPressed: () {
                appController.togglePaintSize();
              },
              child: Column(
                children: [
                  const Text("Toggle Paint Size"),
                   Text(appController.state.toString()),
                ],
              ),
            ),
            Text(
              appController.state.appEnv.apiBaseUrl,
            ),
            Text(
              appController.state.appEnv.name,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              Pubspec.dependencies.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              Pubspec.devDependencies.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
