// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diameter_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiameterState _$DiameterStateFromJson(Map<String, dynamic> json) {
  return _DiameterState.fromJson(json);
}

/// @nodoc
mixin _$DiameterState {
  List<DiameterModel> get diameters => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this DiameterState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiameterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiameterStateCopyWith<DiameterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiameterStateCopyWith<$Res> {
  factory $DiameterStateCopyWith(
          DiameterState value, $Res Function(DiameterState) then) =
      _$DiameterStateCopyWithImpl<$Res, DiameterState>;
  @useResult
  $Res call({List<DiameterModel> diameters, bool isLoading, String? error});
}

/// @nodoc
class _$DiameterStateCopyWithImpl<$Res, $Val extends DiameterState>
    implements $DiameterStateCopyWith<$Res> {
  _$DiameterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiameterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diameters = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      diameters: null == diameters
          ? _value.diameters
          : diameters // ignore: cast_nullable_to_non_nullable
              as List<DiameterModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiameterStateImplCopyWith<$Res>
    implements $DiameterStateCopyWith<$Res> {
  factory _$$DiameterStateImplCopyWith(
          _$DiameterStateImpl value, $Res Function(_$DiameterStateImpl) then) =
      __$$DiameterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DiameterModel> diameters, bool isLoading, String? error});
}

/// @nodoc
class __$$DiameterStateImplCopyWithImpl<$Res>
    extends _$DiameterStateCopyWithImpl<$Res, _$DiameterStateImpl>
    implements _$$DiameterStateImplCopyWith<$Res> {
  __$$DiameterStateImplCopyWithImpl(
      _$DiameterStateImpl _value, $Res Function(_$DiameterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiameterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diameters = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$DiameterStateImpl(
      diameters: null == diameters
          ? _value._diameters
          : diameters // ignore: cast_nullable_to_non_nullable
              as List<DiameterModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiameterStateImpl implements _DiameterState {
  const _$DiameterStateImpl(
      {final List<DiameterModel> diameters = const [],
      this.isLoading = false,
      this.error})
      : _diameters = diameters;

  factory _$DiameterStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiameterStateImplFromJson(json);

  final List<DiameterModel> _diameters;
  @override
  @JsonKey()
  List<DiameterModel> get diameters {
    if (_diameters is EqualUnmodifiableListView) return _diameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diameters);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'DiameterState(diameters: $diameters, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiameterStateImpl &&
            const DeepCollectionEquality()
                .equals(other._diameters, _diameters) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_diameters), isLoading, error);

  /// Create a copy of DiameterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiameterStateImplCopyWith<_$DiameterStateImpl> get copyWith =>
      __$$DiameterStateImplCopyWithImpl<_$DiameterStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiameterStateImplToJson(
      this,
    );
  }
}

abstract class _DiameterState implements DiameterState {
  const factory _DiameterState(
      {final List<DiameterModel> diameters,
      final bool isLoading,
      final String? error}) = _$DiameterStateImpl;

  factory _DiameterState.fromJson(Map<String, dynamic> json) =
      _$DiameterStateImpl.fromJson;

  @override
  List<DiameterModel> get diameters;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of DiameterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiameterStateImplCopyWith<_$DiameterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
