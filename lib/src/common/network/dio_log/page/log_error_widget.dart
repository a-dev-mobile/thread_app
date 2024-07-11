import 'package:flutter/material.dart';
import 'package:thread/src/common/network/dio_log/bean/net_options.dart';

///Страница отображения сообщений об ошибках
class LogErrorWidget extends StatefulWidget {
  const LogErrorWidget(this.netOptions, {super.key});
  final NetOptions netOptions;

  @override
  LogErrorWidgetState createState() => LogErrorWidgetState();
}

class LogErrorWidgetState extends State<LogErrorWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: double.infinity,
      child: Center(
        child: Text(widget.netOptions.errOptions?.errorMsg ?? 'no error'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
