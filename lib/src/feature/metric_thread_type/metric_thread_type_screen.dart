// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/common/widget/common_actions.dart';

final l = L('metric_thread_type_screen');

class MetricThreadTypeScreen extends StatefulWidget {
  const MetricThreadTypeScreen({
    super.key,
  });

  @override
  State<MetricThreadTypeScreen> createState() => _MetricThreadTypeScreenState();
}

class _MetricThreadTypeScreenState extends State<MetricThreadTypeScreen> {
  @override
  // 13. Построение пользовательского интерфейса для домашней страницы
  Widget build(BuildContext context) {
    l.dNoStack('-- build start');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите тип резьбы'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Наружняя',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Внутреняя',
            ),
          ),
        ],
      ),
    );
  }
}
