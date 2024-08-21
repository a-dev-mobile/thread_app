// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_debug_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisualDebugStateImpl _$$VisualDebugStateImplFromJson(
        Map<String, dynamic> json) =>
    _$VisualDebugStateImpl(
      isDebugShowChecked: json['isDebugShowChecked'] as bool? ?? false,
      isShowRepaintRainbow: json['isShowRepaintRainbow'] as bool? ?? false,
      isShowPaintSizeEnabled: json['isShowPaintSizeEnabled'] as bool? ?? false,
      isShowPerformanceOverlay:
          json['isShowPerformanceOverlay'] as bool? ?? false,
    );

Map<String, dynamic> _$$VisualDebugStateImplToJson(
        _$VisualDebugStateImpl instance) =>
    <String, dynamic>{
      'isDebugShowChecked': instance.isDebugShowChecked,
      'isShowRepaintRainbow': instance.isShowRepaintRainbow,
      'isShowPaintSizeEnabled': instance.isShowPaintSizeEnabled,
      'isShowPerformanceOverlay': instance.isShowPerformanceOverlay,
    };
