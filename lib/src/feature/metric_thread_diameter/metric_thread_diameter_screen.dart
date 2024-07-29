// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';

final l = L('metric_thread_diameter_screen');

class MetricDiameterScreen extends StatefulWidget {
  const MetricDiameterScreen({
    super.key,
  });

  @override
  State<MetricDiameterScreen> createState() => _MetricDiameterScreenState();
}

class _MetricDiameterScreenState extends State<MetricDiameterScreen> {
  @override
  // 13. Построение пользовательского интерфейса для домашней страницы
  Widget build(BuildContext context) {
    l.dNoStack('-- build start');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите Диаметер резьбы'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    );
  }
}
