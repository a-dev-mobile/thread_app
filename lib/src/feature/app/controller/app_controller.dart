import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread/src/feature/app/model/app_env.dart';
import 'package:thread/src/feature/initialization/data/local_storage.dart';

part 'app_controller.freezed.dart';
part 'app_controller.g.dart';
part 'app_state.dart';

class AppController with ChangeNotifier {
  AppState _state;
  final LocalStorage _localStorage;

  AppController({required AppState appState, required LocalStorage localStorage})
      : _state = appState,
        _localStorage = localStorage;

  AppState get state => _state;

  void _updateState(AppState newState) {
    if (_state != newState) {
      _state = newState;
      _localStorage.setAppState(_state);
      notifyListeners();
    }
  }

  void toggleDebugButton() {
    _updateState(_state.copyWith(isShowBtnDebug: !_state.isShowBtnDebug));
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
