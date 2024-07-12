import 'package:flutter/material.dart';

import 'package:thread/src/common/widget/common_actions.dart';

/// {@template not_found}
/// NotFoundScreen widget.
/// {@endtemplate}
class NotFoundScreen extends StatelessWidget {
  /// {@macro not_found}
  const NotFoundScreen({this.title, this.message, super.key});

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            title ?? 'Not found',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: CommonActions(),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: SizedBox(
              height: 48,
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [Text(message ?? 'Content not found'), const CounterWidget()],
            ),
          ),
        ),
      );
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  void _incrementCounter() {
    _counter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text('-- $value --');
            },
          ),
          ElevatedButton(onPressed: _incrementCounter, child: const Text('+'))
        ],
      ),
    );
  }
}
