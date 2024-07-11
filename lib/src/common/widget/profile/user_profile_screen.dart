import 'package:flutter/material.dart';
import 'package:thread/src/common/log/l.dart';
import 'package:thread/src/common/widget/profile/app_router_delegate.dart';

// Страница профиля пользователя
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key, required this.routerDelegate});
  final AppRouterDelegate routerDelegate;
  @override
  // 15. Построение пользовательского интерфейса для страницы профиля пользователя
  Widget build(BuildContext context) {
           l.d('-- UserProfilePage build start');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль пользователя"),
      ),
      body:  Center(
        child: Column(
          children: [
            const Text("Здесь будет информация о пользователе"),
             ElevatedButton(
              onPressed: routerDelegate.addHome,
              child:  const Text('добавить страницу домой'),
            ),
          ],
        ),
      ),
    );
  }
}
