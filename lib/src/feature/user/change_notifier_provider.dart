import 'package:flutter/material.dart';

/// [ChangeNotifierProvider] - это виджет, который предоставляет экземпляр [ChangeNotifier]
/// своим потомкам. Это позволяет потомкам слушать изменения в предоставленном notifier
/// и перестраиваться соответственно.
///
/// Этот класс принимает функцию `create`, которая создает notifier, и виджет `child`,
/// который является поддеревом, которое может зависеть от notifier.
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T Function(BuildContext) create;

  const ChangeNotifierProvider({super.key, required this.create, required this.child});

  @override
  State<ChangeNotifierProvider> createState() => _ChangeNotifierProviderState();

  /// Статический метод, который позволяет потомкам получить доступ к notifier.
  static T of<T extends ChangeNotifier>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<_InheritedNotifier<T>>();
    return provider!.notifier!;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  late T notifier;

  @override
  void initState() {
    super.initState();
    notifier = widget.create(context); // Создаем экземпляр notifier с использованием предоставленной функции.
  }

  @override
  void dispose() {
    notifier.dispose(); // Освобождаем ресурсы notifier при удалении провайдера из дерева виджетов.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedNotifier<T>(
      notifier: notifier,
      child: widget.child,
    );
  }
}

/// Специализированный [InheritedWidget], который слушает изменения в [ChangeNotifier].
/// Используется внутренне [ChangeNotifierProvider] для предоставления notifier своим потомкам.
class _InheritedNotifier<T extends ChangeNotifier> extends InheritedNotifier<T> {
  const _InheritedNotifier({required T super.notifier, required super.child});
}

/// [Consumer] - это виджет, который слушает изменения в [ChangeNotifier] и перестраивается
/// всякий раз, когда notifier уведомляет о своих изменениях. Этот виджет позволяет вам
/// предоставить функцию построителя, которая будет вызываться при каждом изменении notifier.
class Consumer<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext, T, Widget?) builder;
  final Widget? child;

  const Consumer({super.key, required this.builder, this.child});

  @override
  Widget build(BuildContext context) {
    final model = ChangeNotifierProvider.of<T>(context);
    return builder(context, model, child);
  }
}
