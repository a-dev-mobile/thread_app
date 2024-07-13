import 'dart:developer' as developer;

class Log {
  Log._internal();

  static bool _detailedLogging = false;
  static String _packagePrefix = '';
  static String _basePath = '';
  static const _filePathColorCode = '\u001b[38;2;145;231;255m';
  static String _lastFileLocation = '';
  // Метод инициализации
  static void initialize({required String packagePrefix, required String basePath, bool detailedLogging = true}) {
    _packagePrefix = packagePrefix;
    _basePath = basePath;
    _detailedLogging = detailedLogging;
  }

  static void info(String message, [Object? e, StackTrace? s]) {
    _log(_colorize(message, _AnsiColor.blue), 'INFO', 800, error: e, stackTrace: s);
  }

  static void debug(String message, [Object? e, StackTrace? s]) {
    _log(_colorize(message, _AnsiColor.green), 'DEBUG', 500, error: e, stackTrace: s);
  }

  static void warning(String message, [Object? e, StackTrace? s]) {
    _log(_colorize(message, _AnsiColor.yellow), 'WARNING', 900, error: e, stackTrace: s);
  }

  static void error(String message, [Object? e, StackTrace? s]) {
    _log(_colorize(message, _AnsiColor.red), 'ERROR', 1000, error: e, stackTrace: s);
  }
  static void errorZone([Object? e, StackTrace? s]) {
    _log(_colorize('errorZone', _AnsiColor.red), 'ERROR', 1000, error: e, stackTrace: s);
  }
  static void _log(String message, String name, int level, {Object? error, StackTrace? stackTrace}) {
    final fileLocation = _detailedLogging && stackTrace != null
        ? _extractFileLocation(stackTrace)
        : _extractFileLocation(StackTrace.current);

    // Log fileLocation only if it's different from the last logged location
    if (fileLocation != 'Unknown' && fileLocation != _lastFileLocation) {
      developer.log(fileLocation, name: name, level: level);
      _lastFileLocation = fileLocation; // Update the last logged file location
    }

    developer.log(message,
        name: name, level: level, error: error, stackTrace: _detailedLogging ? _transformStackTrace(stackTrace) : null);
  }

  static String _colorize(String message, _AnsiColor color) {
    return '${color.code}$message${_AnsiColor.reset.code}';
  }

  static String _extractFileLocation(StackTrace? stackTrace) {
    // Проверка на наличие значений
    if (_packagePrefix.isEmpty || _basePath.isEmpty) {
      developer.log(
        'Warning: Specify _packagePrefix and _basePath values for interactivity.',
      );
      return 'Unknown';
    }

    if (stackTrace != null) {
      final lines = stackTrace.toString().split('\n').reversed;
      for (final line in lines) {
        if (line.contains(_packagePrefix)) {
          final regexPattern = RegExp(
            '${RegExp.escape(_packagePrefix)}(.+\\.dart):(\\d+):(\\d+)',
          );
          final match = regexPattern.firstMatch(line);
          if (match != null) {
            final relativePath = 'lib\\${match.group(1)?.replaceAll('/', r'\') ?? 'Unknown'}';
            final lineNumber = match.group(2) ?? '0';
            final columnNumber = match.group(3) ?? '0';
            return '$_filePathColorCode$_basePath$relativePath:$lineNumber:$columnNumber${_AnsiColor.reset.code}';
          }
        }
      }
    }
    return 'Unknown';
  }

  static StackTrace? _transformStackTrace(StackTrace? stackTrace) {
    if (stackTrace != null) {
      final lines = stackTrace.toString().split('\n');
      final transformedLines = lines.map(_transformStackTraceLine).join('\n');
      return StackTrace.fromString(transformedLines);
    }
    return stackTrace;
  }

  static String _transformStackTraceLine(String line) {
    if (line.contains(_packagePrefix)) {
      return _extractFileLocation(StackTrace.fromString(line));
    }
    return line;
  }
}

class _AnsiColor {
  _AnsiColor._(this.code);
  final String code;

  static final reset = _AnsiColor._('\x1B[0m');
  static final red = _AnsiColor._('\x1B[31m');
  static final green = _AnsiColor._('\x1B[32m');
  static final yellow = _AnsiColor._('\x1B[33m');
  static final blue = _AnsiColor._('\x1B[34m');
}
