// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '${Config.maxScreenLayoutWidth}',
              ),
             
              ElevatedButton(
                onPressed: widget.routerDelegate.goToProfile,
                child: const Text('Перейти на страницу профиля'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
