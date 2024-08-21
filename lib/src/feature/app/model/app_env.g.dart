// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppEnvProdImpl _$$AppEnvProdImplFromJson(Map<String, dynamic> json) =>
    _$AppEnvProdImpl(
      apiBaseUrl: json['apiBaseUrl'] as String? ?? Config.apiBaseUrlProd,
      apiConnectTimeout: json['apiConnectTimeout'] == null
          ? const Duration(seconds: 15)
          : Duration(microseconds: (json['apiConnectTimeout'] as num).toInt()),
      apiReceiveTimeout: json['apiReceiveTimeout'] == null
          ? const Duration(seconds: 15)
          : Duration(microseconds: (json['apiReceiveTimeout'] as num).toInt()),
      name: json['name'] as String? ?? 'prod',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppEnvProdImplToJson(_$AppEnvProdImpl instance) =>
    <String, dynamic>{
      'apiBaseUrl': instance.apiBaseUrl,
      'apiConnectTimeout': instance.apiConnectTimeout.inMicroseconds,
      'apiReceiveTimeout': instance.apiReceiveTimeout.inMicroseconds,
      'name': instance.name,
      'runtimeType': instance.$type,
    };

_$AppEnvDevImpl _$$AppEnvDevImplFromJson(Map<String, dynamic> json) =>
    _$AppEnvDevImpl(
      apiBaseUrl: json['apiBaseUrl'] as String? ?? Config.apiBaseUrlDev,
      apiConnectTimeout: json['apiConnectTimeout'] == null
          ? const Duration(seconds: 50)
          : Duration(microseconds: (json['apiConnectTimeout'] as num).toInt()),
      apiReceiveTimeout: json['apiReceiveTimeout'] == null
          ? const Duration(seconds: 50)
          : Duration(microseconds: (json['apiReceiveTimeout'] as num).toInt()),
      name: json['name'] as String? ?? 'dev',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppEnvDevImplToJson(_$AppEnvDevImpl instance) =>
    <String, dynamic>{
      'apiBaseUrl': instance.apiBaseUrl,
      'apiConnectTimeout': instance.apiConnectTimeout.inMicroseconds,
      'apiReceiveTimeout': instance.apiReceiveTimeout.inMicroseconds,
      'name': instance.name,
      'runtimeType': instance.$type,
    };
