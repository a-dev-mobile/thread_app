part of 'user_profile_screen.dart';

class _UserProfileBloc {
  // ValueNotifier для управления состоянием профиля пользователя
  final ValueNotifier<String> userStringNotifier;
  final ValueNotifier<int> userAgeNotifier;

  _UserProfileBloc({required String initialName, required int initialAge})
      : userStringNotifier = ValueNotifier(initialName),
        userAgeNotifier = ValueNotifier(initialAge);

  // Метод для обновления имени пользователя
  void updateUserName(String newName) {
    userStringNotifier.value = newName;
  }

  // Метод для обновления возраста пользователя
  void updateUserAge(int newAge) {
    userAgeNotifier.value = 10;
  }

  // Уничтожение BLoC
  void dispose() {
    userAgeNotifier.dispose();
    userStringNotifier.dispose();
  }
}
