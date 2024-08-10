// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_env.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppEnv _$AppEnvFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'prod':
      return AppEnvProd.fromJson(json);
    case 'dev':
      return AppEnvDev.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppEnv',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppEnv {
  String get apiBaseUrl => throw _privateConstructorUsedError;
  int get apiConnectTimeout => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String apiBaseUrl, int apiConnectTimeout, String name)
        prod,
    required TResult Function(
            String apiBaseUrl, int apiConnectTimeout, String name)
        dev,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        prod,
    TResult? Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        dev,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        prod,
    TResult Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        dev,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEnvProd value) prod,
    required TResult Function(AppEnvDev value) dev,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEnvProd value)? prod,
    TResult? Function(AppEnvDev value)? dev,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEnvProd value)? prod,
    TResult Function(AppEnvDev value)? dev,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AppEnv to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppEnvCopyWith<AppEnv> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEnvCopyWith<$Res> {
  factory $AppEnvCopyWith(AppEnv value, $Res Function(AppEnv) then) =
      _$AppEnvCopyWithImpl<$Res, AppEnv>;
  @useResult
  $Res call({String apiBaseUrl, int apiConnectTimeout, String name});
}

/// @nodoc
class _$AppEnvCopyWithImpl<$Res, $Val extends AppEnv>
    implements $AppEnvCopyWith<$Res> {
  _$AppEnvCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiBaseUrl = null,
    Object? apiConnectTimeout = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      apiConnectTimeout: null == apiConnectTimeout
          ? _value.apiConnectTimeout
          : apiConnectTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppEnvProdImplCopyWith<$Res>
    implements $AppEnvCopyWith<$Res> {
  factory _$$AppEnvProdImplCopyWith(
          _$AppEnvProdImpl value, $Res Function(_$AppEnvProdImpl) then) =
      __$$AppEnvProdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apiBaseUrl, int apiConnectTimeout, String name});
}

/// @nodoc
class __$$AppEnvProdImplCopyWithImpl<$Res>
    extends _$AppEnvCopyWithImpl<$Res, _$AppEnvProdImpl>
    implements _$$AppEnvProdImplCopyWith<$Res> {
  __$$AppEnvProdImplCopyWithImpl(
      _$AppEnvProdImpl _value, $Res Function(_$AppEnvProdImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiBaseUrl = null,
    Object? apiConnectTimeout = null,
    Object? name = null,
  }) {
    return _then(_$AppEnvProdImpl(
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      apiConnectTimeout: null == apiConnectTimeout
          ? _value.apiConnectTimeout
          : apiConnectTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppEnvProdImpl implements AppEnvProd {
  const _$AppEnvProdImpl(
      {this.apiBaseUrl = Config.apiBaseUrlProd,
      this.apiConnectTimeout = 15000,
      this.name = 'prod',
      final String? $type})
      : $type = $type ?? 'prod';

  factory _$AppEnvProdImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppEnvProdImplFromJson(json);

  @override
  @JsonKey()
  final String apiBaseUrl;
  @override
  @JsonKey()
  final int apiConnectTimeout;
  @override
  @JsonKey()
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppEnv.prod(apiBaseUrl: $apiBaseUrl, apiConnectTimeout: $apiConnectTimeout, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEnvProdImpl &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.apiConnectTimeout, apiConnectTimeout) ||
                other.apiConnectTimeout == apiConnectTimeout) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, apiBaseUrl, apiConnectTimeout, name);

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEnvProdImplCopyWith<_$AppEnvProdImpl> get copyWith =>
      __$$AppEnvProdImplCopyWithImpl<_$AppEnvProdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String apiBaseUrl, int apiConnectTimeout, String name)
        prod,
    required TResult Function(
            String apiBaseUrl, int apiConnectTimeout, String name)
        dev,
  }) {
    return prod(apiBaseUrl, apiConnectTimeout, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        prod,
    TResult? Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        dev,
  }) {
    return prod?.call(apiBaseUrl, apiConnectTimeout, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        prod,
    TResult Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        dev,
    required TResult orElse(),
  }) {
    if (prod != null) {
      return prod(apiBaseUrl, apiConnectTimeout, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEnvProd value) prod,
    required TResult Function(AppEnvDev value) dev,
  }) {
    return prod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEnvProd value)? prod,
    TResult? Function(AppEnvDev value)? dev,
  }) {
    return prod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEnvProd value)? prod,
    TResult Function(AppEnvDev value)? dev,
    required TResult orElse(),
  }) {
    if (prod != null) {
      return prod(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppEnvProdImplToJson(
      this,
    );
  }
}

abstract class AppEnvProd implements AppEnv {
  const factory AppEnvProd(
      {final String apiBaseUrl,
      final int apiConnectTimeout,
      final String name}) = _$AppEnvProdImpl;

  factory AppEnvProd.fromJson(Map<String, dynamic> json) =
      _$AppEnvProdImpl.fromJson;

  @override
  String get apiBaseUrl;
  @override
  int get apiConnectTimeout;
  @override
  String get name;

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppEnvProdImplCopyWith<_$AppEnvProdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppEnvDevImplCopyWith<$Res> implements $AppEnvCopyWith<$Res> {
  factory _$$AppEnvDevImplCopyWith(
          _$AppEnvDevImpl value, $Res Function(_$AppEnvDevImpl) then) =
      __$$AppEnvDevImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apiBaseUrl, int apiConnectTimeout, String name});
}

/// @nodoc
class __$$AppEnvDevImplCopyWithImpl<$Res>
    extends _$AppEnvCopyWithImpl<$Res, _$AppEnvDevImpl>
    implements _$$AppEnvDevImplCopyWith<$Res> {
  __$$AppEnvDevImplCopyWithImpl(
      _$AppEnvDevImpl _value, $Res Function(_$AppEnvDevImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiBaseUrl = null,
    Object? apiConnectTimeout = null,
    Object? name = null,
  }) {
    return _then(_$AppEnvDevImpl(
      apiBaseUrl: null == apiBaseUrl
          ? _value.apiBaseUrl
          : apiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      apiConnectTimeout: null == apiConnectTimeout
          ? _value.apiConnectTimeout
          : apiConnectTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppEnvDevImpl implements AppEnvDev {
  const _$AppEnvDevImpl(
      {this.apiBaseUrl = Config.apiBaseUrlDev,
      this.apiConnectTimeout = 50000,
      this.name = 'dev',
      final String? $type})
      : $type = $type ?? 'dev';

  factory _$AppEnvDevImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppEnvDevImplFromJson(json);

  @override
  @JsonKey()
  final String apiBaseUrl;
  @override
  @JsonKey()
  final int apiConnectTimeout;
  @override
  @JsonKey()
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppEnv.dev(apiBaseUrl: $apiBaseUrl, apiConnectTimeout: $apiConnectTimeout, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEnvDevImpl &&
            (identical(other.apiBaseUrl, apiBaseUrl) ||
                other.apiBaseUrl == apiBaseUrl) &&
            (identical(other.apiConnectTimeout, apiConnectTimeout) ||
                other.apiConnectTimeout == apiConnectTimeout) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, apiBaseUrl, apiConnectTimeout, name);

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEnvDevImplCopyWith<_$AppEnvDevImpl> get copyWith =>
      __$$AppEnvDevImplCopyWithImpl<_$AppEnvDevImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String apiBaseUrl, int apiConnectTimeout, String name)
        prod,
    required TResult Function(
            String apiBaseUrl, int apiConnectTimeout, String name)
        dev,
  }) {
    return dev(apiBaseUrl, apiConnectTimeout, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        prod,
    TResult? Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        dev,
  }) {
    return dev?.call(apiBaseUrl, apiConnectTimeout, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        prod,
    TResult Function(String apiBaseUrl, int apiConnectTimeout, String name)?
        dev,
    required TResult orElse(),
  }) {
    if (dev != null) {
      return dev(apiBaseUrl, apiConnectTimeout, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEnvProd value) prod,
    required TResult Function(AppEnvDev value) dev,
  }) {
    return dev(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEnvProd value)? prod,
    TResult? Function(AppEnvDev value)? dev,
  }) {
    return dev?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEnvProd value)? prod,
    TResult Function(AppEnvDev value)? dev,
    required TResult orElse(),
  }) {
    if (dev != null) {
      return dev(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppEnvDevImplToJson(
      this,
    );
  }
}

abstract class AppEnvDev implements AppEnv {
  const factory AppEnvDev(
      {final String apiBaseUrl,
      final int apiConnectTimeout,
      final String name}) = _$AppEnvDevImpl;

  factory AppEnvDev.fromJson(Map<String, dynamic> json) =
      _$AppEnvDevImpl.fromJson;

  @override
  String get apiBaseUrl;
  @override
  int get apiConnectTimeout;
  @override
  String get name;

  /// Create a copy of AppEnv
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppEnvDevImplCopyWith<_$AppEnvDevImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
