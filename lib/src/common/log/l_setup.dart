import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class L {
  static late Logger _logger;

  // Метод для инициализации логгера с дополнительными параметрами
  static void init({bool includeStackTrace = false, Level logLevel = Level.debug}) {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      filter: CustomLogFilter(logLevel: logLevel),
      output: includeStackTrace ? ConsoleOutputWithStackTrace() : ConsoleOutput(),
    );
  }

  // Методы для логирования
  static void d(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  static void i(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  static void w(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  static void e(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void t(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }
}

class CustomLogFilter extends LogFilter {
  final Level logLevel;

  CustomLogFilter({required this.logLevel});

  @override
  bool shouldLog(LogEvent event) {
    return event.level.index >= logLevel.index;
  }
}

class ConsoleOutputWithStackTrace extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      if (kDebugMode) {
        print(line);
      }
    }
    if (event.lines.isNotEmpty && event.lines.first.contains('ERROR')) {
      if (kDebugMode) {
        print(StackTrace.current);
      }
    }
  }
}
