// lib\src\common\widget\profile\home_screen.dart

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/common/widget/common_actions.dart';

final l = L('ThreadScreen');
class ThreadScreen extends StatefulWidget {
  final AppRouterDelegate routerDelegate;
  

  const ThreadScreen({super.key, required this.routerDelegate});

  @override
  State<ThreadScreen> createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {


  @override
  // 13. Построение пользовательского интерфейса для домашней страницы
  Widget build(BuildContext context) {
    l.dNoStack('-- build start');
    return Scaffold(
      appBar: AppBar(title: const Text('thread'),),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${Config.maxScreenLayoutWidth}',
          ),
        
        ],
      ),
     
    );
  }
}
