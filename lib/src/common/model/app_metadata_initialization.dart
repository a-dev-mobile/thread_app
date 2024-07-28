import 'package:thread/src/common/constant/pubspec.yaml.g.dart';
import 'package:thread/src/common/model/app_metadata.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/util/screen_util.dart';

Future<void> initializeAppMetadata(Dependencies dependencies) async {
  dependencies.metadata = AppMetadata(
    isWeb: false,
    isRelease: false,
    appName: Pubspec.name,
    appVersion: Pubspec.version.representation,
    appVersionMajor: Pubspec.version.major,
    appVersionMinor: Pubspec.version.minor,
    appVersionPatch: Pubspec.version.patch,
    appBuildTimestamp:
        Pubspec.version.build.isNotEmpty ? (int.tryParse(Pubspec.version.build.firstOrNull ?? '-1') ?? -1) : -1,
    operatingSystem: ' platform.operatingSystem.name',
    processorsCount: 7777,
    appLaunchedTimestamp: DateTime.now(),
    locale: 'platform.locale',
    deviceVersion: 'platform.version',
    deviceScreenSize: ScreenUtil.screenSize().representation,
  );
}
