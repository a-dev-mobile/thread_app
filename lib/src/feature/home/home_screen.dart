// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/common/routing/app_router_scope.dart';
import 'package:thread/src/common/routing/page_route_config.dart';
import 'package:thread/src/common/widget/common_actions.dart';

final l = L('HomeScreen');

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

    final appRouterDelegate = AppRouterScope.of(context).routerDelegate;
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: const Text('Home'),
            leading: const SizedBox.shrink(),
            actions: CommonActions(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '${Config.maxScreenLayoutWidth}',
                  ),
                  ElevatedButton(
                    onPressed: () => appRouterDelegate.push(PageType.profile),
                    child: const Text('добавить страницу профиля'),
                  ),
                  ElevatedButton(
                    onPressed: () => appRouterDelegate.push(PageType.notFound),
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
                  Text(
                    '${Config.environment.name} \n have pushed the button this many times:',
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
