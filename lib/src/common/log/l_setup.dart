import 'package:logger/logger.dart';

class CustomPrinter extends LogPrinter {
  final String className;
  final LogPrinter original;

  CustomPrinter(this.className, this.original);

  @override
  List<String> log(LogEvent event) {
    var output = original.log(event);
    return output.map((line) => '[$className] $line').toList();
  }
}

class L {
  final Logger _logger;
  final Logger _loggerNoStack;

  L(String className)
      : _logger = Logger(
          printer: CustomPrinter(className, PrettyPrinter()),
        ),
        _loggerNoStack = Logger(
          printer: CustomPrinter(className, PrettyPrinter(methodCount: 0)),
        );

  // Методы для логирования с стеком
  void d(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  void i(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  void w(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.w(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  void e(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  void t(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.v(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  // Методы для логирования без стека
  void dNoStack(dynamic message, {dynamic error}) {
    _loggerNoStack.d(message, error: error);
  }

  void iNoStack(dynamic message, {dynamic error}) {
    _loggerNoStack.i(message, error: error);
  }

  void wNoStack(dynamic message, {dynamic error}) {
    _loggerNoStack.w(message, error: error);
  }

  void eNoStack(dynamic message, {dynamic error}) {
    _loggerNoStack.e(message, error: error);
  }

  void tNoStack(dynamic message, {dynamic error}) {
    _loggerNoStack.v(message, error: error);
  }
}
