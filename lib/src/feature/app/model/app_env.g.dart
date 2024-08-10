// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppEnvProdImpl _$$AppEnvProdImplFromJson(Map<String, dynamic> json) =>
    _$AppEnvProdImpl(
      apiBaseUrl: json['apiBaseUrl'] as String? ?? Config.apiBaseUrlProd,
      apiConnectTimeout: (json['apiConnectTimeout'] as num?)?.toInt() ?? 15000,
      name: json['name'] as String? ?? 'prod',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppEnvProdImplToJson(_$AppEnvProdImpl instance) =>
    <String, dynamic>{
      'apiBaseUrl': instance.apiBaseUrl,
      'apiConnectTimeout': instance.apiConnectTimeout,
      'name': instance.name,
      'runtimeType': instance.$type,
    };

_$AppEnvDevImpl _$$AppEnvDevImplFromJson(Map<String, dynamic> json) =>
    _$AppEnvDevImpl(
      apiBaseUrl: json['apiBaseUrl'] as String? ?? Config.apiBaseUrlDev,
      apiConnectTimeout: (json['apiConnectTimeout'] as num?)?.toInt() ?? 50000,
      name: json['name'] as String? ?? 'dev',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppEnvDevImplToJson(_$AppEnvDevImpl instance) =>
    <String, dynamic>{
      'apiBaseUrl': instance.apiBaseUrl,
      'apiConnectTimeout': instance.apiConnectTimeout,
      'name': instance.name,
      'runtimeType': instance.$type,
    };
