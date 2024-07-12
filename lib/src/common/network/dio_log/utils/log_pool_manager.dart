import 'package:thread/src/common/network/dio_log/dio_log.dart';

///управление журналом
class LogPoolManager {
  LogPoolManager._singleton() {
    if (!_isInitialized) {
      logMap = <String, NetOptions>{};
      keys = <String>[];
      _isInitialized = true;
    }
  }
  static final LogPoolManager _instance = LogPoolManager._singleton();
  static bool _isInitialized = false;

  ///Запросить хранение журнала
  late Map<String, NetOptions> logMap;

  late List<String> keys;

  ///Максимальное количество запросов на хранение
  int maxCount = 50;

  ResError isError = (res) => res.errOptions != null || res.resOptions?.statusCode == null;

  static LogPoolManager get instance => _instance;

  void onError(ErrOptions err) {
    final key = err.id.toString();
    if (logMap.containsKey(key)) {
      logMap.update(key, (value) {
        value.errOptions = err;
        return value;
      });
    }
  }

  void onRequest(ReqOptions options) {
    if (logMap.length >= maxCount) {
      logMap.remove(keys.last);
      keys.removeLast();
    }
    final key = options.id.toString();
    keys.insert(0, key);
    logMap.putIfAbsent(key, () => NetOptions(reqOptions: options));
  }

  void onResponse(ResOptions response) {
    final key = response.id.toString();
    if (logMap.containsKey(key)) {
      logMap.update(key, (value) {
        response.duration =
            response.responseTime!.millisecondsSinceEpoch - value.reqOptions!.requestTime!.millisecondsSinceEpoch;
        value.resOptions = response;
        return value;
      });
    }
  }

  ///Очистка журнала
  void clear() {
    logMap.clear();
    keys.clear();
  }
}
