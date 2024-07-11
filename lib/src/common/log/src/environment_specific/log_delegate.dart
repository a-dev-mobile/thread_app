import 'package:meta/meta.dart';


import '../log_message.dart';

@internal
// ignore: one_member_abstracts
abstract interface class LogDelegate {
  void log(LogMessage event);
}
