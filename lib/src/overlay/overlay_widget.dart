import 'package:flutter/material.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/network/dio_log/dio_log.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({required this.child, super.key});
  final Widget child;
  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  late OverlayEntry _overlayEntry;




  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
      _overlayEntry.remove(); 
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    // final isShowBtnDebug = Dependencies.of(context).appController.state.isShowBtnDebug;

    // isShowBtnDebug ? showHttpLogBtn(context) : dismissDebugBtn();
    // showHttpLogBtn(context);
    return Stack(
      children: [
        widget.child,
        // const DebugBtn(),
         Positioned(
          bottom: 0,
          left: 0,
          child: GestureDetector(child: _BtnActivateDebug(),onTap: ()
          {

              showHttpLogBtn(context);

          },),
        ),
      ],
    );
  }
}

class _BtnActivateDebug extends StatelessWidget {
  const _BtnActivateDebug();

  @override
  Widget build(BuildContext context) {
    // final screen = ref.watch(screenTrackerNotifierProvider).current;
    // final isActiveClickDebug = screen == SplashPage.name || screen == SettingPage.name;

    // if (!isActiveClickDebug) return const SizedBox.shrink();
    return GestureDetector(
      // onTap: ref.read(debugNotifierProvider.notifier).setClickDebug,
      onTap: () {
        // showHttpLogBtn(context);
      },
      child: Container(
        color: Colors.amber,
        width: 50,
        height: 50,
      ),
    );
  }
}
