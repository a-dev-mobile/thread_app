import 'package:flutter/widgets.dart';
import 'package:thread/src/feature/visual_debug/visual_debug_controller.dart';

class VisualDebugProvider extends InheritedWidget {
  final VisualDebugController controller;

  const VisualDebugProvider({
    super.key,
    required this.controller,
    required super.child,
  });

  // Метод, который будут использовать дочерние виджеты для доступа к данным
  static VisualDebugController of(BuildContext context) {
    final VisualDebugProvider? result = context.dependOnInheritedWidgetOfExactType<VisualDebugProvider>();
    assert(result != null, 'No VisualDebugProvider found in context');
    return result!.controller;
  }
  @override
  bool updateShouldNotify(VisualDebugProvider oldWidget) {
    // Уведомляем дочерние виджеты только если значение изменилось
    return false;
  }
}
