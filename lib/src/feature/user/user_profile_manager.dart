// Файл: user_profile_manager.dart
part of 'user_profile_screen.dart';

final _pageBucket = PageStorageBucket();

class _UserProfileManager {
  bool shouldSave = true;
  final PageStorageKey<String> pageKey = const PageStorageKey<String>('UserProfilePage');

  void saveUserProfile(BuildContext context, UserProfileModel profile) {
    if (shouldSave) {
      String serializedProfile = jsonEncode(profile.toJson());
      _pageBucket.writeState(context, serializedProfile, identifier: pageKey);
    }
  }

  UserProfileModel? readUserProfile(BuildContext context) {
    String? serializedProfile = _pageBucket.readState(context, identifier: pageKey);
    if (serializedProfile != null) {
      return UserProfileModel.fromJson(jsonDecode(serializedProfile));
    }
    return null;
  }

  void clearUserProfile(BuildContext context) {
    _pageBucket.writeState(context, null, identifier: pageKey);
    shouldSave = false;
  }

  void clearScrollPosition(BuildContext context) {
    final storage = PageStorage.of(context);
    storage.writeState(context, null, identifier: pageKey);
    shouldSave = false;
  }
}
