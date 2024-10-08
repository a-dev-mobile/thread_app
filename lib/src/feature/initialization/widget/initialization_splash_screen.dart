import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/widget/radial_progress_indicator.dart';

final _l = L('initialization_splash_screen');

class InitializationSplashScreen extends StatelessWidget {
  const InitializationSplashScreen({required this.progress, super.key});

  final ValueListenable<({int progress, String message})> progress;

  @override
  Widget build(BuildContext context) {
    _l.dNoStack('-- build start');
    final theme = View.of(context).platformDispatcher.platformBrightness == Brightness.dark
        ? ThemeData.dark()
        : ThemeData.light();
    return Material(
      color: theme.primaryColor,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              RadialProgressIndicator(
                size: 128,
                child: ValueListenableBuilder<({String message, int progress})>(
                  valueListenable: progress,
                  builder: (context, value, _) => Text(
                    '${value.progress}%',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      height: 1,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Opacity(
                opacity: .25,
                child: ValueListenableBuilder<({String message, int progress})>(
                  valueListenable: progress,
                  builder: (context, value, _) => Text(
                    value.message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
