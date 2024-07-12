part of 'user_profile_screen.dart';

class _UserProfileBloc {
  // ValueNotifier для управления состоянием профиля пользователя
  final ValueNotifier<UserProfileModel> userProfileNotifier;

  _UserProfileBloc({required UserProfileModel initialProfile}) : userProfileNotifier = ValueNotifier(initialProfile);

  // Метод для обновления имени пользователя
  void updateUserName(String newName) {
    userProfileNotifier.value = userProfileNotifier.value.copyWith(name: newName);
  }

  // Метод для обновления возраста пользователя
  void updateUserAge(int newAge) {
    userProfileNotifier.value = userProfileNotifier.value.copyWith(age: newAge);
  }

  // Уничтожение BLoC
  void dispose() {
    userProfileNotifier.dispose();
  }
}
