part of 'visual_debug_controller.dart';

@freezed
sealed class VisualDebugState with _$VisualDebugState {
  // const AppState._();

  const factory VisualDebugState({

    @Default(false) bool isDebugShowChecked,
    @Default(false) bool isShowRepaintRainbow,
    @Default(false) bool isShowPaintSizeEnabled,
    @Default(false) bool isShowPerformanceOverlay,
  }) = _VisualDebugState;

  factory VisualDebugState.fromJson(Map<String, Object?> json) => _$VisualDebugStateFromJson(json);
}
