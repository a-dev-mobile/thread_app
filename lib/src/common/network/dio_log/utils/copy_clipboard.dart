import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Копировать на картон
void copyClipboard(BuildContext context, dynamic value) {
  final stringValue = value?.toString() ?? 'null';
  final snackBar = SnackBar(content: Text('$stringValue\n\n copy success to clipboard'));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  Clipboard.setData(ClipboardData(text: stringValue));
}
