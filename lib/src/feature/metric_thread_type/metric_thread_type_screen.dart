// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

final _l = L('metric_thread_type_screen');

class MetricTypeScreen extends StatefulWidget {
  const MetricTypeScreen({
    super.key,
  });

  @override
  State<MetricTypeScreen> createState() => _MetricTypeScreenState();
}

class _MetricTypeScreenState extends State<MetricTypeScreen> {
  @override
  // 13. Построение пользовательского интерфейса для домашней страницы
  Widget build(BuildContext context) {
    _l.dNoStack('-- build start');

    final appRouterDelegate = Dependencies.of(context).routerDelegate;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите тип резьбы'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => appRouterDelegate.push(PageType.metricDiameters),
            child: const Text(
              'Наружная',
            ),
          ),
          ElevatedButton(
            onPressed: () => appRouterDelegate.push(PageType.metricDiameters),
            child: const Text(
              'Внутренняя',
            ),
          ),
        ],
      ),
    );
  }
}
