// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/common/widget/common_actions.dart';

class HomeScreen extends StatefulWidget {
  final AppRouterDelegate routerDelegate;
  final String title;

  const HomeScreen({super.key, required this.routerDelegate, required this.title});

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
    l.d('-- HomeScreen build start');
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
                    onPressed: widget.routerDelegate.pushToProfileRoute,
                    child: const Text('добавить страницу профиля'),
                  ),
                  ElevatedButton(
                    onPressed: widget.routerDelegate.goToErrorScreen,
                    child: const Text('Перейти на страницу ошибки'),
                  ),

                         ElevatedButton(
                    onPressed: widget.routerDelegate.goToHomeRoute,
                    child: const Text('Перейти на главную страницу '),
                  ),
                       ElevatedButton(
                    onPressed: widget.routerDelegate.pushHomeRoute,
                    child: const Text('добавить главную страницу '),
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
