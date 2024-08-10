// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      appEnv: json['appEnv'] == null
          ? const AppEnv.prod()
          : AppEnv.fromJson(json['appEnv'] as Map<String, dynamic>),
      isShowBtnDebug: json['isShowBtnDebug'] as bool? ?? false,
      isShowRepaintRainbow: json['isShowRepaintRainbow'] as bool? ?? false,
      isShowPaintSizeEnabled: json['isShowPaintSizeEnabled'] as bool? ?? false,
      isShowPerformanceOverlay:
          json['isShowPerformanceOverlay'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'appEnv': instance.appEnv,
      'isShowBtnDebug': instance.isShowBtnDebug,
      'isShowRepaintRainbow': instance.isShowRepaintRainbow,
      'isShowPaintSizeEnabled': instance.isShowPaintSizeEnabled,
      'isShowPerformanceOverlay': instance.isShowPerformanceOverlay,
    };
