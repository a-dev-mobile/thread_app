import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread/src/common/constant/config.dart';

part 'app_env.freezed.dart';
part 'app_env.g.dart';

/// Класс `AppEnv` определяет конфигурации для разных окружений приложения.
/// Используется пакет `freezed` для генерации неизменяемых классов и сериализации.
/// Содержит две фабрики для продакшн (`prod`) и разработки (`dev`) окружений.
@freezed
sealed class AppEnv with _$AppEnv {
  
  /// Конфигурация для окружения.
  /// 
  /// [apiBaseUrl] - базовый URL API 
  /// Значение по умолчанию устанавливается из константы
  ///
  /// [apiConnectTimeout] - время ожидания подключения к API.
  /// 
  /// [apiReceiveTimeout] - время ожидания получения данных от API.
  /// 
  /// [name] - имя окружения, используется для идентификации. По умолчанию 'prod'.
  const factory AppEnv.prod({
    @Default(Config.apiBaseUrlProd) String apiBaseUrl,

    @Default(Duration(seconds: 15)) Duration apiConnectTimeout,
    @Default(Duration(seconds: 15)) Duration apiReceiveTimeout,
    @Default('prod') String name,
  }) = AppEnvProd;


  const factory AppEnv.dev({
    @Default(Config.apiBaseUrlDev) String apiBaseUrl,
    @Default(Duration(seconds: 50)) Duration apiConnectTimeout,
    @Default(Duration(seconds: 50)) Duration apiReceiveTimeout,
    @Default('dev') String name,
  }) = AppEnvDev;

  /// Фабрика для создания объекта `AppEnv` из JSON.
  /// Используется для десериализации данных, например, при загрузке конфигурации из файла.
  factory AppEnv.fromJson(Map<String, dynamic> json) => _$AppEnvFromJson(json);
}
