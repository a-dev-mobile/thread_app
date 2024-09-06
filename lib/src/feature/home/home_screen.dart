// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/network/dio_log/dio_log.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

final _l = L('home_screen');

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Подписка на изменения состояния
    // Dependencies.of(context).visualDebugController.addListener(_onAppStateChange);
  }

  @override
  void dispose() {
    // Отписываемся от слушателя при удалении виджета
    // Dependencies.of(context).visualDebugController.removeListener(_onAppStateChange);
    super.dispose();
  }

  void _onAppStateChange() {
    // final isShowBtnDebug = Dependencies.of(context).visualDebugController.state.isShowBtnDebug;

    // if (isShowBtnDebug) {
    //   showHttpLogBtn(context);
    // } else {
    //   dismissDebugBtn();
    // }
  }

  @override
  // 13. Построение пользовательского интерфейса для домашней страницы
  Widget build(BuildContext context) {
    _l.dNoStack('-- build start');

    final dependencies = Dependencies.of(context);
    final appEnv = dependencies.appEnv;
    final appRouterDelegate = dependencies.routerDelegate;
    final visualDebugController = dependencies.visualDebugController;
    // final project = dependencies.visualDebugController.state.appEnv;

    // switch (project) {
    //   case AppEnvDev():
    //     l.d('dev');
    //     l.d(project.apiBaseUrl);
    //   case AppEnvProd():
    //     l.d('prod');
    //     l.d(project.apiBaseUrl);
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                // SettingsScope.of(context).toggleTheme();
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
                showHttpLogBtn(context);
              },
              child: const Text("Toggle showHttpLogBtn"),
            ),
            ElevatedButton(
              onPressed: () {
                visualDebugController.toggleDebugShowChecked();
              },
              child: const Text("Toggle toggleDebugShowChecked"),
            ),
            ElevatedButton(
              onPressed: () {
                visualDebugController.toggleShowPerformanceOverlay();
              },
              child: const Text("Toggle toggleShowPerformanceOverlay"),
            ),
            ElevatedButton(
              onPressed: () {
                visualDebugController.toggleRepaintRainbow();
              },
              child: const Text("Toggle Repaint Rainbow"),
            ),
            ElevatedButton(
              onPressed: () {
                visualDebugController.togglePaintSize();
              },
              child: const Text("Toggle Paint Size"),
            ),
            Text(visualDebugController.state.toString()),
            Text(
              appEnv.apiBaseUrl,
            ),
            Text(
              appEnv.name,
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
