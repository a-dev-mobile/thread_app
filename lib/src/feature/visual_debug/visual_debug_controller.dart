import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/feature/initialization/data/local_storage.dart';

part 'visual_debug_controller.freezed.dart';
part 'visual_debug_controller.g.dart';
part 'visual_debug_state.dart';

final _l = L('visual_debug_controller');

class VisualDebugController with ChangeNotifier {
  late VisualDebugState _state;
  final LocalStorage _localStorage;

  VisualDebugController({required LocalStorage localStorage}) : _localStorage = localStorage;

  VisualDebugState get state => _state;

  Future<void> initialize() async {
    try {
      final storedState = await _localStorage.getVisualDebugState();

      _state = storedState;
      notifyListeners();
    } catch (e, s) {
      // Логирование ошибки или обработка по вашему усмотрению
      _l.e('Failed to initialize VisualDebugController', error: e, stackTrace: s);
    }
  }

  void _updateState(VisualDebugState newState) {
    if (_state != newState) {
      _state = newState;
      _localStorage.setVisualDebugState(_state);
      notifyListeners();
    }
  }

  void toggleDebugShowChecked() {
    _updateState(_state.copyWith(isDebugShowChecked: !_state.isDebugShowChecked));
  }

  void toggleRepaintRainbow() {
    _updateState(_state.copyWith(isShowRepaintRainbow: !_state.isShowRepaintRainbow));
  }

  void toggleShowPerformanceOverlay() {
    _updateState(_state.copyWith(isShowPerformanceOverlay: !_state.isShowPerformanceOverlay));
  }

  void togglePaintSize() {
    _updateState(_state.copyWith(isShowPaintSizeEnabled: !_state.isShowPaintSizeEnabled));
  }
}
