part of 'app_controller.dart';

@freezed
sealed class AppState with _$AppState {
  // const AppState._();

  const factory AppState({
    @Default(AppEnv.prod()) AppEnv appEnv,
    @Default(false) bool isShowBtnDebug,
    @Default(false) bool isShowRepaintRainbow,
    @Default(false) bool isShowPaintSizeEnabled,
    @Default(false) bool isShowPerformanceOverlay,
  }) = _AppState;

  factory AppState.fromJson(Map<String, Object?> json) => _$AppStateFromJson(json);
}
