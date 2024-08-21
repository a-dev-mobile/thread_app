import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/feature/app/model/app_env.dart';
import 'package:thread/src/feature/visual_debug/visual_debug_controller.dart';

final _l = L('local_storage');

/// Класс для работы с локальным хранилищем, включая асинхронное и кешированное хранилище.
/// Обеспечивает сохранение и получение данных с возможностью кеширования и обработки ошибок.
class LocalStorage {
  final Completer<SharedPreferencesAsync> _asyncPrefsCompleter = Completer();
  final Completer<SharedPreferencesWithCache> _cachePrefsCompleter = Completer();
  final bool _isShowLog;
  DateTime _lastCacheUpdate = DateTime.now();

  static const _cacheDuration = Duration(minutes: 5);

  /// Конструктор с опциональной настройкой отображения логов.
  LocalStorage({bool isShowLog = false}) : _isShowLog = isShowLog;

  /// Инициализация асинхронных и кешированных настроек.
  Future<void> initialize() async {
    _asyncPrefsCompleter.complete(SharedPreferencesAsync());
    _cachePrefsCompleter.complete(
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{
            _appId,
            _appEnv,
            _visualDebugState,
            _userAgent,
          },
        ),
      ),
    );
  }

  /// Получение асинхронного хранилища.
  Future<SharedPreferencesAsync> get asyncPrefs => _asyncPrefsCompleter.future;

  /// Получение кешированного хранилища.
  Future<SharedPreferencesWithCache> get cachePrefs => _cachePrefsCompleter.future;

  // ******************************
  static const _appId = '_appId';

  Future<String?> getAppId({bool forceRefresh = false}) async {
    return _getString(key: _appId, forceRefresh: forceRefresh);
  }

  Future<void> setAppId(String? value) async {
    await _setString(key: _appId, value: value ?? '');
  }


  // ******************************
  static const _appEnv = '_appEnv';

  Future<AppEnv> getAppEnv({bool forceRefresh = false}) async {
    final jsonString = await _getString(key: _appEnv, forceRefresh: forceRefresh);
    return jsonString != null ? AppEnv.fromJson(json.decode(jsonString)) : const AppEnv.prod();
  }

  Future<void> setAppEnv(AppEnv value) async {
    final jsonString = json.encode(value.toJson());
    await _setString(key: _appEnv, value: jsonString);
  }




  // ******************************
  static const _visualDebugState = '_visualDebugState';

  Future<VisualDebugState> getVisualDebugState({bool forceRefresh = false}) async {
    final jsonString = await _getString(key: _visualDebugState, forceRefresh: forceRefresh);
    return jsonString != null ? VisualDebugState.fromJson(json.decode(jsonString)) : const VisualDebugState();
  }

  Future<void> setVisualDebugState(VisualDebugState value) async {
    final jsonString = json.encode(value.toJson());
    await _setString(key: _visualDebugState, value: jsonString);
  }

  // ******************************
  static const _userAgent = 'userAgent';

  Future<String?> getUserAgent({bool forceRefresh = false}) async {
    return _getString(key: _userAgent, forceRefresh: forceRefresh);
  }

  Future<void> setUserAgent(String? value) async {
    await _setString(key: _userAgent, value: value ?? '');
  }

  // ******************************
  static const _TargetUrl = '_TargetUrl';

  Future<String?> getTargetUrl({bool forceRefresh = false}) async {
    return _getString(
      key: _TargetUrl,
      forceRefresh: forceRefresh,
      defaultValue: 'https://unknow.com?utm_source=organic_mob',
    );
  }

  Future<void> setTargetUrl(String? value) async {
    await _setString(key: _TargetUrl, value: value ?? '');
  }

  // ******************************
  // Универсальные методы для хранения и получения данных

  /// Универсальный метод для сохранения строки в хранилище.
  Future<void> _setString({required String key, required String value}) async {
    try {
      final asyncPrefsInstance = await asyncPrefs;
      final cachePrefsInstance = await cachePrefs;

      await asyncPrefsInstance.setString(key, value);
      if (await _isValidKey(key)) {
        await cachePrefsInstance.setString(key, value);
      }
      _log('SET', key, value);
      _lastCacheUpdate = DateTime.now();
    } catch (e, s) {
      _recordError(e, s, 'SET', key, value);
    }
  }

  /// Универсальный метод для получения строки из хранилища.
  Future<String?> _getString({
    required String key,
    String? defaultValue,
    bool forceRefresh = false,
  }) async {
    try {
      final cachePrefsInstance = await cachePrefs;

      if (!await _isValidKey(key)) {
        final asyncPrefsInstance = await asyncPrefs;
        return await asyncPrefsInstance.getString(key) ?? defaultValue;
      }

      if (forceRefresh || DateTime.now().difference(_lastCacheUpdate) > _cacheDuration) {
        await cachePrefsInstance.reloadCache();
        _lastCacheUpdate = DateTime.now();
      }

      final value = cachePrefsInstance.getString(key);
      if (value != null) {
        return value;
      }

      final asyncPrefsInstance = await asyncPrefs;
      return await asyncPrefsInstance.getString(key) ?? defaultValue;
    } catch (e, s) {
      _recordError(e, s, 'GET', key, defaultValue);
      return defaultValue;
    }
  }

// Универсальный метод для получения булевого значения из хранилища.
  Future<bool?> _getBool({
    required String key,
    bool defaultValue = false,
    bool forceRefresh = false,
  }) async {
    try {
      final cachePrefsInstance = await cachePrefs;

      if (!await _isValidKey(key)) {
        final asyncPrefsInstance = await asyncPrefs;
        return await asyncPrefsInstance.getBool(key) ?? defaultValue;
      }

      if (forceRefresh || DateTime.now().difference(_lastCacheUpdate) > _cacheDuration) {
        await cachePrefsInstance.reloadCache();
        _lastCacheUpdate = DateTime.now();
      }

      final value = cachePrefsInstance.getBool(key);
      if (value != null) {
        return value;
      }

      final asyncPrefsInstance = await asyncPrefs;
      return await asyncPrefsInstance.getBool(key) ?? defaultValue;
    } catch (e, s) {
      _recordError(e, s, 'GET', key, defaultValue);
      return defaultValue;
    }
  }

// Универсальный метод для получения целого числа из хранилища.
  Future<int?> _getInt({
    required String key,
    int defaultValue = 0,
    bool forceRefresh = false,
  }) async {
    try {
      final cachePrefsInstance = await cachePrefs;

      if (!await _isValidKey(key)) {
        final asyncPrefsInstance = await asyncPrefs;
        return await asyncPrefsInstance.getInt(key) ?? defaultValue;
      }

      if (forceRefresh || DateTime.now().difference(_lastCacheUpdate) > _cacheDuration) {
        await cachePrefsInstance.reloadCache();
        _lastCacheUpdate = DateTime.now();
      }

      final value = cachePrefsInstance.getInt(key);
      if (value != null) {
        return value;
      }

      final asyncPrefsInstance = await asyncPrefs;
      return await asyncPrefsInstance.getInt(key) ?? defaultValue;
    } catch (e, s) {
      _recordError(e, s, 'GET', key, defaultValue);
      return defaultValue;
    }
  }

// Универсальный метод для получения дробного числа из хранилища.
  Future<double?> _getDouble({
    required String key,
    double defaultValue = 0.0,
    bool forceRefresh = false,
  }) async {
    try {
      final cachePrefsInstance = await cachePrefs;

      if (!await _isValidKey(key)) {
        final asyncPrefsInstance = await asyncPrefs;
        return await asyncPrefsInstance.getDouble(key) ?? defaultValue;
      }

      if (forceRefresh || DateTime.now().difference(_lastCacheUpdate) > _cacheDuration) {
        await cachePrefsInstance.reloadCache();
        _lastCacheUpdate = DateTime.now();
      }

      final value = cachePrefsInstance.getDouble(key);
      if (value != null) {
        return value;
      }

      final asyncPrefsInstance = await asyncPrefs;
      return await asyncPrefsInstance.getDouble(key) ?? defaultValue;
    } catch (e, s) {
      _recordError(e, s, 'GET', key, defaultValue);
      return defaultValue;
    }
  }

// Универсальный метод для получения списка строк из хранилища.
  Future<List<String>?> _getStringList({
    required String key,
    bool forceRefresh = false,
  }) async {
    try {
      final cachePrefsInstance = await cachePrefs;

      if (!await _isValidKey(key)) {
        final asyncPrefsInstance = await asyncPrefs;
        return await asyncPrefsInstance.getStringList(key) ?? [];
      }

      if (forceRefresh || DateTime.now().difference(_lastCacheUpdate) > _cacheDuration) {
        await cachePrefsInstance.reloadCache();
        _lastCacheUpdate = DateTime.now();
      }

      final value = cachePrefsInstance.getStringList(key);
      if (value != null) {
        return value;
      }

      final asyncPrefsInstance = await asyncPrefs;
      return await asyncPrefsInstance.getStringList(key) ?? [];
    } catch (e, s) {
      _recordError(e, s, 'GET', key, []);
      return [];
    }
  }

// Проверка наличия ключа в allowList с обработкой ArgumentError
  Future<bool> _isValidKey(String key) async {
    try {
      final cachePrefsInstance = await cachePrefs;
      return cachePrefsInstance.containsKey(key);
    } catch (e) {
      if (e is ArgumentError) {
        _log('WARN', key, 'Key is not included in the PreferencesFilter allowlist');
        return false;
      }
      rethrow; // Если это не ArgumentError, выбрасываем дальше
    }
  }
  // ******************************
  // Методы для работы с JSON-данными

  /// Метод для сохранения JSON-объекта в хранилище.
  Future<void> setJson({required String key, required Map<String, dynamic> value}) async {
    final jsonString = json.encode(value);
    await _setString(key: key, value: jsonString);
  }

  /// Метод для получения JSON-объекта из хранилища.
  Future<Map<String, dynamic>?> getJson({required String key, bool forceRefresh = false}) async {
    final jsonString = await _getString(key: key, forceRefresh: forceRefresh, defaultValue: '{}');
    return jsonString != null ? json.decode(jsonString) as Map<String, dynamic> : null;
  }

  // ******************************
  // Логирование и обработка ошибок

  /// Логирование действия, если включен режим отображения логов.
  void _log(String action, String key, dynamic value) async {
    if (_isShowLog) {
      _l.i('$action > $key, Value: $value');
    }
  }

  /// Запись ошибки с детализацией действия, ключа и значения.
  void _recordError(
    Object exception,
    StackTrace stackTrace,
    String action,
    String key,
    dynamic value,
  ) async {
    _l.e(
      '$action > $key, Value: $value',
      error: exception,
      stackTrace: stackTrace,
    );
  }

  // ******************************
  // Очистка всех данных

  /// Полная очистка всех данных из асинхронного и кешированного хранилища.
  Future<void> clearAll() async {
    try {
      final asyncPrefsInstance = await asyncPrefs;
      final cachePrefsInstance = await cachePrefs;

      await asyncPrefsInstance.clear();
      await cachePrefsInstance.clear();
      _log('CLEAR', 'All Data', 'All data cleared');
    } catch (e, s) {
      _recordError(e, s, 'CLEAR', 'All Data', 'Failed to clear all data');
    }
  }
}
