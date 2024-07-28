import 'package:flutter/material.dart';
import 'package:thread/src/feature/home/home_screen.dart';
import 'package:thread/src/feature/metric_thread_type/metric_thread_type_screen.dart';
import 'package:thread/src/feature/no_found_screen/not_found_screen.dart';
import 'package:thread/src/feature/user/user_profile_screen.dart';
import 'package:thread/src/common/routing/page_route_config.dart';

class PageProvider {
  static Widget getPage(PageRouteConfig config) {
    switch (config.pageType) {
      case PageType.metricThreadType:
        return const MetricThreadTypeScreen();
      case PageType.home:
        return const HomeScreen();
      case PageType.notFound:
        return const NotFoundScreen();
      case PageType.profile:
        return const UserProfileScreen();
      default:
        return const NotFoundScreen();
    }
  }
}
