import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/network/dio_log/bean/net_options.dart';
import 'package:thread/src/common/network/dio_log/dio_log.dart';


class LogRequestWidget extends StatefulWidget {
  const LogRequestWidget(this.netOptions, {super.key});
  final NetOptions netOptions;

  @override
  LogRequestWidgetState createState() => LogRequestWidgetState();
}

class LogRequestWidgetState extends State<LogRequestWidget> with AutomaticKeepAliveClientMixin {
  late TextEditingController _urlController;
  late TextEditingController _cookieController;
  late TextEditingController _paramController;
  late TextEditingController _bodyController;
  bool reqFail = false;
  @override
  void initState() {
    _urlController = TextEditingController();
    _cookieController = TextEditingController();
    _paramController = TextEditingController();
    _bodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _bodyController.dispose();
    _paramController.dispose();
    _urlController.dispose();
    _cookieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final reqOpt = widget.netOptions.reqOptions!;
    final resOpt = widget.netOptions.resOptions;

    ///Формат времени запроса
    final requestTime = getTimeStr(reqOpt.requestTime!);

    ///Формат времени возврата
    final responseTime = getTimeStr(resOpt?.responseTime ?? reqOpt.requestTime!);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Tip: long press a key to copy the value to the clipboard',
              style: TextStyle(fontSize: 10, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                copyClipboard(
                    context,
                    'url:${reqOpt.url}\nmethod:${reqOpt.method}\nrequestTime:$requestTime\nresponseTime:$responseTime\n'
                    'duration:${resOpt?.duration ?? 0}ms\n${dataFormat(reqOpt.data)}'
                    '\nparams:${toJson(reqOpt.params)}\nheader:${reqOpt.headers}');
              },
              child: const Text('copy all'),
            ),
            _buildKeyValue('url', reqOpt.url),
            _buildKeyValue('method', reqOpt.method),
            _buildKeyValue('requestTime', requestTime),
            _buildKeyValue('responseTime', responseTime),
            _buildKeyValue('duration', '${resOpt?.duration ?? 0}ms'),
            _buildParam(reqOpt.data),
            _buildJsonView('params', reqOpt.params),
            _buildJsonView('header', reqOpt.headers),
          ],
        ),
      ),
    );
  }

  ///Отображение построения дерева json
  Widget _buildJsonView(dynamic key, dynamic json) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getDefText('$key:'),
        JsonView(json: json),
      ],
    );
  }

  ///Создайте отображение дочерних узлов
  Widget _buildKeyValue(dynamic k, dynamic v) {
    Widget w = _getDefText('$k:${v is String ? v : v?.toString()}');
    if (k != null) {
      w = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: () {
          copyClipboard(context, v);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: w,
        ),
      );
    }
    return w;
  }

  ///Размер текста по умолчанию
  Text _getDefText(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 15),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Map<dynamic, dynamic>? formDataMap;
  Widget _buildParam(dynamic data) {
    if (data is Map) {
      return _buildJsonView('body', data);
    } else if (data is FormData) {
      formDataMap = {}
        ..addEntries(data.fields)
        ..addEntries(data.files);
      return _getDefText('formData:${map2Json(formDataMap)}');
    } else if (data is String) {
      try {
        final decodedMap = json.decode(data);
        return _buildJsonView('body', decodedMap);
      } catch (e) {
        return Text('body: $data');
      }
    } else {
      return const SizedBox();
    }
  }

  String dataFormat(dynamic data) {
    if (data is FormData) {
      return 'formData:${map2Json(formDataMap)}';
    } else {
      return 'body:${toJson(data)}';
    }
  }
}
