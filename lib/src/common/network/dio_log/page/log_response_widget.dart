import 'package:flutter/material.dart';
import 'package:thread/src/common/network/dio_log/dio_log.dart';

class LogResponseWidget extends StatefulWidget {
  const LogResponseWidget(this.netOptions, {super.key});
  final NetOptions netOptions;

  @override
  LogResponseWidgetState createState() => LogResponseWidgetState();
}

class LogResponseWidgetState extends State<LogResponseWidget> with AutomaticKeepAliveClientMixin {
  bool isShowAll = false;
  double fontSize = 14;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final response = widget.netOptions.resOptions;
    final json = response?.data ?? 'no response';
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              Text(isShowAll ? 'shrink all' : 'expand all'),
              Switch(
                value: isShowAll,
                onChanged: (check) {
                  isShowAll = check;

                  setState(() {});
                },
              ),
              Expanded(
                child: Slider(
                  value: fontSize,
                  max: 30,
                  min: 1,
                  onChanged: (v) {
                    fontSize = v;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const Text(
            'Tip: long press a key to copy the value to the clipboard',
            style: TextStyle(
              fontSize: 10,
              color: Colors.red,
            ),
          ),
          _buildJsonView('headers:', response?.headers),
          _buildJsonView('response.data:', json),
        ],
      ),
    );
  }

  ///Создать отображение дерева JSON
  Widget _buildJsonView(dynamic key, dynamic json) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            copyClipboard(context, toJson(json));
          },
          child: const Text('copy json'),
        ),
        Text(
          '$key',
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        JsonView(
          json: json,
          isShowAll: isShowAll,
          fontSize: fontSize,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
