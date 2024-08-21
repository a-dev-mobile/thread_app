// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visual_debug_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VisualDebugState _$VisualDebugStateFromJson(Map<String, dynamic> json) {
  return _VisualDebugState.fromJson(json);
}

/// @nodoc
mixin _$VisualDebugState {
  bool get isDebugShowChecked => throw _privateConstructorUsedError;
  bool get isShowRepaintRainbow => throw _privateConstructorUsedError;
  bool get isShowPaintSizeEnabled => throw _privateConstructorUsedError;
  bool get isShowPerformanceOverlay => throw _privateConstructorUsedError;

  /// Serializes this VisualDebugState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisualDebugState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisualDebugStateCopyWith<VisualDebugState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualDebugStateCopyWith<$Res> {
  factory $VisualDebugStateCopyWith(
          VisualDebugState value, $Res Function(VisualDebugState) then) =
      _$VisualDebugStateCopyWithImpl<$Res, VisualDebugState>;
  @useResult
  $Res call(
      {bool isDebugShowChecked,
      bool isShowRepaintRainbow,
      bool isShowPaintSizeEnabled,
      bool isShowPerformanceOverlay});
}

/// @nodoc
class _$VisualDebugStateCopyWithImpl<$Res, $Val extends VisualDebugState>
    implements $VisualDebugStateCopyWith<$Res> {
  _$VisualDebugStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisualDebugState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDebugShowChecked = null,
    Object? isShowRepaintRainbow = null,
    Object? isShowPaintSizeEnabled = null,
    Object? isShowPerformanceOverlay = null,
  }) {
    return _then(_value.copyWith(
      isDebugShowChecked: null == isDebugShowChecked
          ? _value.isDebugShowChecked
          : isDebugShowChecked // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$VisualDebugStateImplCopyWith<$Res>
    implements $VisualDebugStateCopyWith<$Res> {
  factory _$$VisualDebugStateImplCopyWith(_$VisualDebugStateImpl value,
          $Res Function(_$VisualDebugStateImpl) then) =
      __$$VisualDebugStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDebugShowChecked,
      bool isShowRepaintRainbow,
      bool isShowPaintSizeEnabled,
      bool isShowPerformanceOverlay});
}

/// @nodoc
class __$$VisualDebugStateImplCopyWithImpl<$Res>
    extends _$VisualDebugStateCopyWithImpl<$Res, _$VisualDebugStateImpl>
    implements _$$VisualDebugStateImplCopyWith<$Res> {
  __$$VisualDebugStateImplCopyWithImpl(_$VisualDebugStateImpl _value,
      $Res Function(_$VisualDebugStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisualDebugState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDebugShowChecked = null,
    Object? isShowRepaintRainbow = null,
    Object? isShowPaintSizeEnabled = null,
    Object? isShowPerformanceOverlay = null,
  }) {
    return _then(_$VisualDebugStateImpl(
      isDebugShowChecked: null == isDebugShowChecked
          ? _value.isDebugShowChecked
          : isDebugShowChecked // ignore: cast_nullable_to_non_nullable
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
class _$VisualDebugStateImpl implements _VisualDebugState {
  const _$VisualDebugStateImpl(
      {this.isDebugShowChecked = false,
      this.isShowRepaintRainbow = false,
      this.isShowPaintSizeEnabled = false,
      this.isShowPerformanceOverlay = false});

  factory _$VisualDebugStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisualDebugStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isDebugShowChecked;
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
    return 'VisualDebugState(isDebugShowChecked: $isDebugShowChecked, isShowRepaintRainbow: $isShowRepaintRainbow, isShowPaintSizeEnabled: $isShowPaintSizeEnabled, isShowPerformanceOverlay: $isShowPerformanceOverlay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisualDebugStateImpl &&
            (identical(other.isDebugShowChecked, isDebugShowChecked) ||
                other.isDebugShowChecked == isDebugShowChecked) &&
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
  int get hashCode => Object.hash(runtimeType, isDebugShowChecked,
      isShowRepaintRainbow, isShowPaintSizeEnabled, isShowPerformanceOverlay);

  /// Create a copy of VisualDebugState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisualDebugStateImplCopyWith<_$VisualDebugStateImpl> get copyWith =>
      __$$VisualDebugStateImplCopyWithImpl<_$VisualDebugStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisualDebugStateImplToJson(
      this,
    );
  }
}

abstract class _VisualDebugState implements VisualDebugState {
  const factory _VisualDebugState(
      {final bool isDebugShowChecked,
      final bool isShowRepaintRainbow,
      final bool isShowPaintSizeEnabled,
      final bool isShowPerformanceOverlay}) = _$VisualDebugStateImpl;

  factory _VisualDebugState.fromJson(Map<String, dynamic> json) =
      _$VisualDebugStateImpl.fromJson;

  @override
  bool get isDebugShowChecked;
  @override
  bool get isShowRepaintRainbow;
  @override
  bool get isShowPaintSizeEnabled;
  @override
  bool get isShowPerformanceOverlay;

  /// Create a copy of VisualDebugState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisualDebugStateImplCopyWith<_$VisualDebugStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
