import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thread/src/common/constant/config.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/common/model/dependencies.dart';
import 'package:thread/src/common/routing/page_route_config.dart';
import 'package:thread/src/feature/user/user_profile_model.dart';

part 'user_profile_bloc.dart';
part 'user_profile_manager.dart';

final _l = L('user_profile_screen');

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> with AutomaticKeepAliveClientMixin<UserProfileScreen> {
  late final _UserProfileBloc bloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    bloc = _UserProfileBloc(initialName: 'test name', initialAge: 30);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _l.dNoStack('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant UserProfileScreen oldWidget) {
    _l.dNoStack('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _l.dNoStack('-- build start');

    final routerDelegate = Dependencies.of(context).routerDelegate;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль пользователя"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Здесь будет информация о пользователе"),
            const Text(Config.apiBaseUrlDev),
            ValueListenableBuilder(
              valueListenable: bloc.userStringNotifier,
              builder: (context, name, child) {
                return Text('Name: $name', style: const TextStyle(fontSize: 24));
              },
            ),
            ValueListenableBuilder(
              valueListenable: bloc.userAgeNotifier,
              builder: (context, age, child) {
                return Text('Age: $age', style: const TextStyle(fontSize: 24));
              },
            ),
            ElevatedButton(
              onPressed: () => bloc.updateUserName("Jane Doe"),
              child: const Text('Change Name to Jane Doe'),
            ),
            ElevatedButton(
              onPressed: () => bloc.updateUserName("Doe Jane"),
              child: const Text('Change Name to Doe Jane'),
            ),
            ElevatedButton(
              onPressed: () => bloc.updateUserAge(28),
              child: const Text('Change Age to 28'),
            ),
            ElevatedButton(
              onPressed: () => bloc.updateUserAge(29),
              child: const Text('Change Age to 29'),
            ),
            ElevatedButton(
              onPressed: () {
                routerDelegate.push(PageType.notFound);
              },
              child: const Text('добавить страницу ошибки и очистить сохраненые данные'),
            ),
            const Text(Config.apiBaseUrlProd),
            ElevatedButton(
              onPressed: () => routerDelegate.push(PageType.home),
              child: const Text('добавить страницу домой'),
            ),
          ],
        ),
      ),
    );
  }
}
