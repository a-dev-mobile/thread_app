// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  AppEnv get appEnv => throw _privateConstructorUsedError;
  bool get isShowBtnDebug => throw _privateConstructorUsedError;
  bool get isShowRepaintRainbow => throw _privateConstructorUsedError;
  bool get isShowPaintSizeEnabled => throw _privateConstructorUsedError;
  bool get isShowPerformanceOverlay => throw _privateConstructorUsedError;

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {AppEnv appEnv,
      bool isShowBtnDebug,
      bool isShowRepaintRainbow,
      bool isShowPaintSizeEnabled,
      bool isShowPerformanceOverlay});

  $AppEnvCopyWith<$Res> get appEnv;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appEnv = null,
    Object? isShowBtnDebug = null,
    Object? isShowRepaintRainbow = null,
    Object? isShowPaintSizeEnabled = null,
    Object? isShowPerformanceOverlay = null,
  }) {
    return _then(_value.copyWith(
      appEnv: null == appEnv
          ? _value.appEnv
          : appEnv // ignore: cast_nullable_to_non_nullable
              as AppEnv,
      isShowBtnDebug: null == isShowBtnDebug
          ? _value.isShowBtnDebug
          : isShowBtnDebug // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowRepaintRainbow: null == isShowRepaintRainbow
          ? _value.isShowRepaintRainbow
          : isShowRepaintRainbow // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowPaintSizeEnabled: null == isShowPaintSizeEnabled
          ? _value.isShowPaintSizeEnabled
          : isShowPaintSizeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowPerformanceOverlay: null == isShowPerformanceOverlay
          ? _value.isShowPerformanceOverlay
          : isShowPerformanceOverlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppEnvCopyWith<$Res> get appEnv {
    return $AppEnvCopyWith<$Res>(_value.appEnv, (value) {
      return _then(_value.copyWith(appEnv: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppEnv appEnv,
      bool isShowBtnDebug,
      bool isShowRepaintRainbow,
      bool isShowPaintSizeEnabled,
      bool isShowPerformanceOverlay});

  @override
  $AppEnvCopyWith<$Res> get appEnv;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appEnv = null,
    Object? isShowBtnDebug = null,
    Object? isShowRepaintRainbow = null,
    Object? isShowPaintSizeEnabled = null,
    Object? isShowPerformanceOverlay = null,
  }) {
    return _then(_$AppStateImpl(
      appEnv: null == appEnv
          ? _value.appEnv
          : appEnv // ignore: cast_nullable_to_non_nullable
              as AppEnv,
      isShowBtnDebug: null == isShowBtnDebug
          ? _value.isShowBtnDebug
          : isShowBtnDebug // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowRepaintRainbow: null == isShowRepaintRainbow
          ? _value.isShowRepaintRainbow
          : isShowRepaintRainbow // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowPaintSizeEnabled: null == isShowPaintSizeEnabled
          ? _value.isShowPaintSizeEnabled
          : isShowPaintSizeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowPerformanceOverlay: null == isShowPerformanceOverlay
          ? _value.isShowPerformanceOverlay
          : isShowPerformanceOverlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {this.appEnv = const AppEnv.prod(),
      this.isShowBtnDebug = false,
      this.isShowRepaintRainbow = false,
      this.isShowPaintSizeEnabled = false,
      this.isShowPerformanceOverlay = false});

  factory _$AppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppStateImplFromJson(json);

  @override
  @JsonKey()
  final AppEnv appEnv;
  @override
  @JsonKey()
  final bool isShowBtnDebug;
  @override
  @JsonKey()
  final bool isShowRepaintRainbow;
  @override
  @JsonKey()
  final bool isShowPaintSizeEnabled;
  @override
  @JsonKey()
  final bool isShowPerformanceOverlay;

  @override
  String toString() {
    return 'AppState(appEnv: $appEnv, isShowBtnDebug: $isShowBtnDebug, isShowRepaintRainbow: $isShowRepaintRainbow, isShowPaintSizeEnabled: $isShowPaintSizeEnabled, isShowPerformanceOverlay: $isShowPerformanceOverlay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.appEnv, appEnv) || other.appEnv == appEnv) &&
            (identical(other.isShowBtnDebug, isShowBtnDebug) ||
                other.isShowBtnDebug == isShowBtnDebug) &&
            (identical(other.isShowRepaintRainbow, isShowRepaintRainbow) ||
                other.isShowRepaintRainbow == isShowRepaintRainbow) &&
            (identical(other.isShowPaintSizeEnabled, isShowPaintSizeEnabled) ||
                other.isShowPaintSizeEnabled == isShowPaintSizeEnabled) &&
            (identical(
                    other.isShowPerformanceOverlay, isShowPerformanceOverlay) ||
                other.isShowPerformanceOverlay == isShowPerformanceOverlay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appEnv, isShowBtnDebug,
      isShowRepaintRainbow, isShowPaintSizeEnabled, isShowPerformanceOverlay);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppStateImplToJson(
      this,
    );
  }
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final AppEnv appEnv,
      final bool isShowBtnDebug,
      final bool isShowRepaintRainbow,
      final bool isShowPaintSizeEnabled,
      final bool isShowPerformanceOverlay}) = _$AppStateImpl;

  factory _AppState.fromJson(Map<String, dynamic> json) =
      _$AppStateImpl.fromJson;

  @override
  AppEnv get appEnv;
  @override
  bool get isShowBtnDebug;
  @override
  bool get isShowRepaintRainbow;
  @override
  bool get isShowPaintSizeEnabled;
  @override
  bool get isShowPerformanceOverlay;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
