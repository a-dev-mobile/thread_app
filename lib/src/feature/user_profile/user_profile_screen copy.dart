// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:thread/src/common/constant/config.dart';
// 
// import 'package:thread/src/common/routing/app_router_delegate.dart';
// import 'package:thread/src/feature/user_profile/user_profile_model.dart';

// part 'user_profile_bloc.dart';
// part 'user_profile_manager.dart';

// class UserProfilePage extends StatefulWidget {
//   final AppRouterDelegate routerDelegate;
//   const UserProfilePage({super.key, required this.routerDelegate});

//   @override
//   State<UserProfilePage> createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage> {
//   late final _UserProfileBloc bloc;
//   late final _UserProfileManager manager;

//   @override
//   void initState() {
//     super.initState();
//     manager = _UserProfileManager();
//     var savedProfile = manager.readUserProfile(context);
//     bloc = _UserProfileBloc(initialProfile: savedProfile ?? const UserProfileModel(name: "John Doe", age: 30));
//   }

//   @override
//   void dispose() {
//     if (manager.shouldSave) {
//       manager.saveUserProfile(context, bloc.userProfileNotifier.value);
//     }

//     bloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     l.d('-- UserProfilePage build start');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Профиль пользователя"),
//       ),
//       body: PageStorage(
//         bucket: _pageBucket,
//         child: SingleChildScrollView(
//           key: manager.pageKey,
//           child: Column(
//             children: [
//               const Text("Здесь будет информация о пользователе"),
//               const Text(Config.proxyUrl),
//               ValueListenableBuilder<UserProfileModel>(
//                 valueListenable: bloc.userProfileNotifier,
//                 builder: (context, profile, child) {
//                   return Text('Name: ${profile.name}, Age: ${profile.age}', style: const TextStyle(fontSize: 24));
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () => bloc.updateUserName("Jane Doe"),
//                 child: const Text('Change Name 1'),
//               ),
//               ElevatedButton(
//                 onPressed: () => bloc.updateUserName("Doe Jane "),
//                 child: const Text('Change Name 2'),
//               ),
//               ElevatedButton(
//                 onPressed: () => bloc.updateUserAge(28),
//                 child: const Text('Change Age'),
//               ),
//               ElevatedButton(
//                 onPressed: () => bloc.updateUserAge(29),
//                 child: const Text('Change Age'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   manager.clearUserProfile(context);
//                   manager.clearScrollPosition(context);
//                   widget.routerDelegate.pushToErrorScreen();
//                 },
//                 child: const Text('добавить страницу ошибки и очистить сохраненые данные'),
//               ),
//               const Text(Config.proxyUrl),
//               ElevatedButton(
//                 onPressed: widget.routerDelegate.pushHomeRoute,
//                 child: const Text('добавить страницу домой'),
//               ),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//               const Text(Config.proxyUrl),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
