import 'package:flutter/material.dart';

import 'package:thread/src/common/network/dio_log/dio_log.dart';

///Подробности сетевого запроса
class LogWidget extends StatefulWidget {
  const LogWidget(this.netOptions, {super.key});
  final NetOptions netOptions;

  @override
  LogWidgetState createState() => LogWidgetState();
}

class LogWidgetState extends State<LogWidget> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'request'),
    const Tab(text: 'response'),
  ];

  PageController? _pageController;

  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.netOptions.reqOptions!.url!,
          style: const TextStyle(fontSize: 11),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 1,
        iconTheme: theme.iconTheme,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return LogRequestWidget(widget.netOptions);
          } else if (index == 1) {
            return LogResponseWidget(widget.netOptions);
          } else {
            return LogErrorWidget(widget.netOptions);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _bottomTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload_outlined),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_download_outlined),
            label: 'Response',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: 'Error',
          ),
        ],
      ),
    );
  }

  void _onPageChanged(int value) {
    if (mounted) {
      setState(() {
        currentIndex = value;
      });
    }
  }

  void _bottomTap(int value) {
    _pageController!.animateToPage(
      value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
