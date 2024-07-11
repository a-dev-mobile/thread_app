import 'package:flutter/material.dart';
import 'package:thread/src/common/network/dio_log/dio_log.dart';




OverlayEntry? itemEntry;

///Показать кнопку http log
Future<void> showHttpLogBtn(
  BuildContext context, {
  Widget? button,
  Color? btnColor,
}) async {
  try {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    dismissDebugBtn();
    itemEntry = OverlayEntry(
      builder: (BuildContext context) => button ?? DraggableButtonWidget(btnColor: btnColor),
    );

    ///Показать плавающее меню
    // ignore: use_build_context_synchronously
    Overlay.of(context).insert(itemEntry!);
    // ignore: empty_catches
  } catch (e) {}
}

///Закрываем плавающую кнопку
void dismissDebugBtn() {
  itemEntry?.remove();
  itemEntry = null;
}

///
bool debugBtnIsShow() {
  return !(itemEntry == null);
}

class DraggableButtonWidget extends StatefulWidget {
  const DraggableButtonWidget({
    super.key,
    this.title = 'http log',
    this.onTap,
    this.btnSize = 66,
    this.btnColor,
  });
  final String title;
  final Function? onTap;
  final double btnSize;
  final Color? btnColor;

  @override
  DraggableButtonWidgetState createState() => DraggableButtonWidgetState();
}

class DraggableButtonWidgetState extends State<DraggableButtonWidget> {
  double left = 30;
  double top = 100;
  late double screenWidth;
  late double screenHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    ///Событие клика по умолчанию
    void tap() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => const HttpLogListWidget(),
        ),
      );
    }

    Widget w;
    var primaryColor = widget.btnColor ?? Theme.of(context).primaryColor;
    primaryColor = primaryColor.withOpacity(0.6);
    w = GestureDetector(
      onTap: widget.onTap as void Function()? ?? tap,
      onPanUpdate: _dragUpdate,
      child: Container(
        width: widget.btnSize,
        height: widget.btnSize,
        color: primaryColor,
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );

    ///Циркуляр
    w = ClipRRect(
      borderRadius: BorderRadius.circular(widget.btnSize / 2),
      child: w,
    );

    ///Рассчитать предел смещения
    if (left < 1) {
      left = 1;
    }
    if (left > screenWidth - widget.btnSize) {
      left = screenWidth - widget.btnSize;
    }

    if (top < 1) {
      top = 1;
    }
    if (top > screenHeight - widget.btnSize) {
      top = screenHeight - widget.btnSize;
    }

    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: left, top: top),
      child: w,
    );
  }

  void _dragUpdate(DragUpdateDetails detail) {
    final offset = detail.delta;
    left = left + offset.dx;
    top = top + offset.dy;
    setState(() {});
  }
}
