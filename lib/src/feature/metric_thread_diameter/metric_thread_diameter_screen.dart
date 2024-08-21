// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/feature/metric_thread_diameter/controller/diameter_controller.dart';
import 'package:thread/src/feature/metric_thread_diameter/data/diameter_repository_impl.dart';

final _l = L('metric_thread_diameter_screen');

class MetricDiameterScreen extends StatefulWidget {
  const MetricDiameterScreen({
    super.key,
  });

  @override
  State<MetricDiameterScreen> createState() => _MetricDiameterScreenState();
}

class _MetricDiameterScreenState extends State<MetricDiameterScreen> {
  late final DiameterController _controller;

  @override
  void initState() {
    super.initState();
    final repository = DiameterRepositoryImpl(dio: Dependencies.of(context).dio);
    _controller = DiameterController(repository);
    _controller.addListener(_updateState);
    _controller.loadDiameters();
  }

  @override
  void dispose() {
    _controller.removeListener(_updateState);
    _controller.dispose();
    super.dispose();
  }

  void _updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _l.dNoStack('-- build start');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите Диаметер резьбы'),
      ),
      body: Builder(
        builder: (context) {
          if (_controller.state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_controller.state.error != null) {
            return Center(child: Text('Error: ${_controller.state.error}'));
          }
          return ListView.builder(
            itemCount: _controller.state.diameters.length,
            itemBuilder: (context, index) {
              final data = _controller.state.diameters[index];
              return ListTile(
                title: Text(data.diam),
              );
            },
          );
        },
      ),
    );
  }
}
