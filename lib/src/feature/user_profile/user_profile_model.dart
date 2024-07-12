
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String name,
    required int age,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, Object?> json) => _$UserProfileModelFromJson(json);
}
