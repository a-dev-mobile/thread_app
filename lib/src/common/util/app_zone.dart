import 'dart:async';


import 'package:thread/src/common/log/log_setup%20copy%202.dart';

/// Catch all application errors and logs.
void appZone(FutureOr<void> Function() fn) => runZonedGuarded<void>(
      () => fn(),
      Log.errorZone,

      // const LogOptions(
      //   handlePrint: true,
      //   messageFormatting: _messageFormatting,
      //   outputInRelease: false,
      //   printColors: true,
      // ),
    );

// /// Formats the log message.
// Object _messageFormatting(LogMessage log) => '${_timeFormat(log.timestamp)} | ${log.message}';

// /// Formats the time.
// String _timeFormat(DateTime time) => '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
