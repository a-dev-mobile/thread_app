import 'package:freezed_annotation/freezed_annotation.dart';

part 'diameter_model.freezed.dart';
part 'diameter_model.g.dart';

@freezed
class DiameterModel with _$DiameterModel {
  const factory DiameterModel({
    required int id,
    required String diam,
  }) = _DiameterModel;

  factory DiameterModel.fromJson(Map<String, dynamic> json) => _$DiameterModelFromJson(json);
}
