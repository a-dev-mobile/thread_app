// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diameter_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiameterStateImpl _$$DiameterStateImplFromJson(Map<String, dynamic> json) =>
    _$DiameterStateImpl(
      diameters: (json['diameters'] as List<dynamic>?)
              ?.map((e) => DiameterModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$DiameterStateImplToJson(_$DiameterStateImpl instance) =>
    <String, dynamic>{
      'diameters': instance.diameters,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
