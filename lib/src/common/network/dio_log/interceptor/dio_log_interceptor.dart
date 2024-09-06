// ignore_for_file: cascade_invocations

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:thread/src/common/network/dio_log/dio_log.dart';

///log Класс обработки журнала
class DioLogInterceptor implements Interceptor {
  DioLogInterceptor() {
    logManage = LogPoolManager.instance;
  }
  LogPoolManager? logManage;

  ///Выводить ли логи на консоль
  static bool enablePrintLog = true;

  ///Сбор данных об ошибках
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final errOptions = ErrOptions();
    errOptions.id = err.requestOptions.hashCode;
    errOptions.errorMsg = err.toString();
    //onResponse(err.response);
    logManage?.onError(errOptions);
    if (err.response != null) saveResponse(err.response!);
    return handler.next(err);
  }

  ///Запросить сбор данных о теле
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final reqOpt = ReqOptions();
    reqOpt.id = options.hashCode;
    reqOpt.url = options.uri.toString();
    reqOpt.method = options.method;
    reqOpt.contentType = options.contentType.toString();
    reqOpt.requestTime = DateTime.now();
    reqOpt.params = options.queryParameters;
    reqOpt.data = options.data;
    reqOpt.headers = options.headers;
    logManage?.onRequest(reqOpt);
    return handler.next(options);
  }

  ///Сбор данных тела ответа
  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    saveResponse(response);
    return handler.next(response);
  }

  void saveResponse(Response<dynamic> response) {
    final resOpt = ResOptions();
    resOpt.id = response.requestOptions.hashCode;
    resOpt.responseTime = DateTime.now();
    resOpt.statusCode = response.statusCode ?? 0;
    resOpt.data = response.data;
    resOpt.headers = response.headers.map;
    logManage?.onResponse(resOpt);
    if (enablePrintLog) {
      final logNp = LogPoolManager.instance.logMap[resOpt.id.toString()]!;
      log('request: url:${logNp.reqOptions?.url}');
      log('request: method:${logNp.reqOptions?.method}');
      log('request: params:${logNp.reqOptions?.params}');
      log('request: data:${logNp.reqOptions?.data}');
      log('request: duration:${getTimeStr1(logNp.reqOptions!.requestTime!)}');
      log('response: ${toJson(logNp.resOptions?.data)}');
    }
  }
}
