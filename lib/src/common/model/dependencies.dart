import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:thread/src/common/model/app_metadata.dart';
import 'package:thread/src/common/routing/app_route_information_parser.dart';
import 'package:thread/src/common/routing/app_router_delegate.dart';
import 'package:thread/src/feature/app/controller/app_controller.dart';

import 'package:thread/src/feature/initialization/data/local_storage.dart';

import 'package:thread/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Dependencies
class Dependencies {
  Dependencies();

  /// The state from the closest instance of this class.
  factory Dependencies.of(BuildContext context) => InheritedDependencies.of(context);

  /// App metadata
  late final AppMetadata metadata;

  /// Local storage
  late final LocalStorage localStorage;

  /// API Client
  late final Dio dio;

  /// Router Delegate
  late final AppRouterDelegate routerDelegate;

   late final AppController appController;

  /// Route Information Parser
  late final AppRouteInformationParser routeInformationParser;
}
