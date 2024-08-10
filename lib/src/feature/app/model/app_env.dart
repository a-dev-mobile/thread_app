import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread/src/common/constant/config.dart';

part 'app_env.freezed.dart';
part 'app_env.g.dart';

@freezed
sealed class AppEnv with _$AppEnv {
  const factory AppEnv.prod({
    @Default(Config.apiBaseUrlProd) String apiBaseUrl,

    @Default(15000) int apiConnectTimeout,
    @Default('prod') String name,
  }) = AppEnvProd;

  const factory AppEnv.dev({
    @Default(Config.apiBaseUrlDev) String apiBaseUrl,
    @Default(50000) int apiConnectTimeout,
    @Default('dev') String name,
  }) = AppEnvDev;
  factory AppEnv.fromJson(Map<String, dynamic> json) => _$AppEnvFromJson(json);
}
