import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:thread/src/feature/developer/widget/developer_button.dart';

class CommonActions extends ListBase<Widget> {
  CommonActions([List<Widget>? actions])
      : _actions = <Widget>[
          ...?actions,
          if (kDebugMode) const DeveloperButton(),
          // const HistoryButton(),

          // const LogOutButton(),
        ];

  final List<Widget> _actions;

  @override
  int get length => _actions.length;

  @override
  set length(int newLength) => _actions.length = newLength;

  @override
  Widget operator [](int index) => _actions[index];

  @override
  void operator []=(int index, Widget value) => _actions[index] = value;
}
