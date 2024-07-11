// // ignore_for_file: constant_identifier_names

// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:thread/core/extension/common.dart';
// import 'package:dartlog/dartlog.dart';
// import 'package:thread/core/service/network/dio_log/interceptor/dio_log_interceptor.dart';
// import 'package:thread/core/storage/app_storage.dart';
// import 'package:thread/core/widgets/failure_internet.dart';
// import 'package:thread/feature/onboarding/vew/onboarding_page.dart';
// import 'package:thread/feature/splash/view/splash_page.dart';
// import 'package:thread/navigation/app_router.dart';

// abstract class BaseInterceptor extends InterceptorsWrapper {
//   void addHeaders(
//     RequestOptions options,
//     Map<String, dynamic> headers,
//   ) {
//     options.headers.addAll(headers);
//   }
// }

// // Constants
// const _JWT_TOKEN_NOT_FOUND = 'jwt_token_not_found';
// const _JWT_TOKEN_INVALID = 'jwt_token_invalid';
// const _JWT_TOKEN_EXPIRED = 'jwt_token_expired';
// const _JUST_A_MOMENT = 'just a moment';
// const _ATTENTION_REQUIRED = 'attention required';
// const _ACCESS_DENIED = 'access denied';
// const _RECAPTCHA_REQUIRED = 'recaptcha required';

// /// Для postback отпраявляем нашему бэку appmetricaDeviceToken полученый через AppMetrica
// class AppMetricaDeviceIDInterceptor extends BaseInterceptor {
//   AppMetricaDeviceIDInterceptor({required this.appMetricaDeviceID});

//   final String? appMetricaDeviceID;

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     if (appMetricaDeviceID != null) {
//       addHeaders(options, {'appmetrica-device-id': appMetricaDeviceID});
//     }
//     handler.next(options);
//   }
// }

// class ContentTypeInterceptor extends InterceptorsWrapper {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     if (options.method == 'PATCH' ||
//         !options.headers.containsKey('content-type')) {
//       options.headers['content-type'] = 'application/json';
//     } else if (options.method == 'POST' && options.data is FormData) {
//       options.headers['content-type'] = 'image/png';
//     }

//     handler.next(options);
//   }
// }

// class AuthenticationInterceptor extends InterceptorsWrapper {
//   AuthenticationInterceptor({
//     required AppStorage storage,
//     required String baseUrl,
//     required AppRouter router,
//     required String userAgent,
//   })  : _baseUrl = baseUrl,
//         _storage = storage,
//         _userAgent = userAgent,
//         _go = router {
//     _setupDio();
//   }
//   final AppStorage _storage;
//   final AppRouter _go;
//   final String _baseUrl;
//   final String _userAgent;
//   late Dio dio;
//   void _setupDio() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: _baseUrl,
//         connectTimeout: const Duration(seconds: 60),
//         receiveTimeout: const Duration(seconds: 50),
//       ),
//     )..interceptors.addAll([
//         DioLogInterceptor(),
//         AcceptInterceptor(),
//         UserAgentInterceptor(_userAgent),
//       ]);
//   }

//   @override
//   Future<void> onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     if (err.response == null) {
//       handler.next(err);

//       return;
//     }

//     final statusCode = err.response?.statusCode;
//     var responseBody = ''; // Initialize responseBody as an empty string
//     if (err.response?.data is Map) {
//       final responseData = err.response?.data as Map;
//       // Check if responseData has a non-empty 'message' key and is a string
//       if (responseData.containsKey('message') &&
//           responseData['message'] is String) {
//         final message = responseData['message'].toString();
//         if (message.isNotEmpty) {
//           responseBody = message;
//         }
//       }
//     } else if (err.response?.data is String) {
//       responseBody = err.response!.data.toString().toLowerCase();
//     }

//     if (responseBody.contains(_JWT_TOKEN_NOT_FOUND)) {
//       _handleLogout();
//       return;
//     }
//     final isCloudFlareProtection = responseBody.contains(_JUST_A_MOMENT) ||
//         responseBody.contains(_ATTENTION_REQUIRED);

//     final isCustomCaptcha = responseBody.contains(_ACCESS_DENIED) ||
//         responseBody.contains(_RECAPTCHA_REQUIRED);

//     if (_go.router.location() == SplashPage.path ||
//         _go.router.location() == OnBoardingPage.path) {
//       handler.next(err);
//       return;
//     }
//     switch (statusCode) {
//       case 403:
//         if (responseBody.contains(_JWT_TOKEN_EXPIRED) ||
//             responseBody.contains(_JWT_TOKEN_INVALID)) {
//           await _refreshToken();
//         } else if (isCloudFlareProtection) {
//           await _handleCloudFlareProtection(err, handler);
//         } else if (isCustomCaptcha) {
//           await _openPageFailureInternet();
//         } else {
//           await _handleForbiddenError(err, handler);
//         }
//       case 428:
//         await _openPageFailureInternet();
//       default:
//         handler.next(err);
//         break;
//     }
//   }

//   Future<void> _handleCloudFlareProtection(
//     DioException error,
//     ErrorInterceptorHandler handler,
//   ) async {
//     await _openPageFailureInternet();
//   }

//   Future<void> _handleForbiddenError(
//     DioException error,
//     ErrorInterceptorHandler handler,
//   ) async {
//     try {
//       await _refreshToken();

//       handler.next(error);
//     } catch (e, stackTrace) {
//       await _openPageFailureInternet();
//       Error.throwWithStackTrace(e, stackTrace);
//     }
//   }

//   void _handleLogout() {
//     _go.exitApp(storage: _storage);
//   }

//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     // final tokenRef = await _storage.getTokenRef();

//     // final tokenDate = await _storage.getTokenDate();

//     // if (tokenDate.isNotEmpty && tokenRef.isNotEmpty) {
//       // final tokenExpiryDate = DateTime.parse(tokenDate);
//     // /  final timeToTokenExpiry =
//     // /      tokenExpiryDate.difference(DateTime.now().toUtc());
// // /
//     // /  if (timeToTokenExpiry <= const Duration(minutes: 1)) {
//     // /    await _refreshToken();
//     // /  }
//     }

//     // final token = await _storage.getToken();
//     // if (token.isNotEmpty) {
//       // options.headers.addAll({'X-Authorization': 'Bearer $token'});
//     // }
// //
//     // handler.next(options);
//   }

//   int _tokenRefreshAttempts = 0;
//   static const int _maxTokenRefreshAttempts = 5;
//   Future<void> _refreshToken() async {
//     if (_tokenRefreshAttempts >= _maxTokenRefreshAttempts) {
//       // Если превышено количество попыток, завершаем работу и перенаправляем пользователя
//       _go.router.goNamed(SplashPage.name);
//       return;
//     }

//     _tokenRefreshAttempts++; // Увеличиваем счетчик попыток

//     final tokenRef = await _storage.getTokenRef();
//     if (tokenRef.isNotEmpty) {
//       try {
//         final response = await dio.post<dynamic>(
//           '/api/token/refresh',
//           data: {'refresh_token': tokenRef},
//         );

//         if (response.statusCode == 200) {
//           await _setTokenDetailsFromResponse(
//             response.data as Map<String, dynamic>,
//           );
//         } else {
//           throw Exception('Failed to refresh token');
//         }
//       } catch (e, stackTrace) {
//         logger.e('error 1 _refreshToken', error: e, stackTrace: stackTrace);
//         // await _storage.setTokenRef('');
//         try {
//           final phone = await _storage.getPhoneNotFormat();
//           final password = await _storage.getPassword();

//           if (phone.isNotEmpty && password.isNotEmpty) {
//             final response = await dio.post<dynamic>(
//               '/api/token/get',
//               data: <String, dynamic>{
//                 'login': '7$phone',
//                 'password': password,
//               },
//             );
//             if (response.statusCode == 200) {
//               await _setTokenDetailsFromResponse(
//                 response.data as Map<String, dynamic>,
//               );
//             } else {
//               throw Exception('Failed to retrieve token using login details');
//             }
//           } else {
//             // throw Exception('Missing login details');
//             await FirebaseCrashlytics.instance.recordError(
//               Exception('Missing login details'),
//               null,
//               reason: 'a non-fatal error',
//               information: ['[phone=$phone, password=$password]'],
//             );
//           }
//         } catch (e, stackTrace) {
//           logger.e('error _refreshToken', error: e, stackTrace: stackTrace);
//           await _handleTokenRefreshError(e, stackTrace);
//         }
//       }
//     } else {
//       _handleLogout();
//     }
//   }

//   Future<void> _setTokenDetailsFromResponse(Map<String, dynamic> data) async {
//     // await _storage.setToken(data['token'].toString());
//     // await _storage.setTokenRef(data['refresh_token'].toString());
//     // await _storage.setTokenDate(data['ttl_date'].toString());

//     if (data.containsKey('step')) {
//       // await _storage.setLastStep(data['step'].toString());
//     }
//     _tokenRefreshAttempts =
//         0; // Сброс счетчика попыток после успешного обновления
//   }

//   Future<void> _handleTokenRefreshError(
//     Object error,
//     StackTrace stackTrace,
//   ) async {
//     await FirebaseCrashlytics.instance.recordError(
//       error,
//       stackTrace,
//       reason: 'a non-fatal error',
//       information: ['AuthenticationInterceptor', '_isRefreshToken'],
//     );
//     await _openPageFailureInternet();
//   }

//   Future<void> _openPageFailureInternet() async {
//     final isTestUser = await _storage.isTestUser();
//     if (!isTestUser) {
//       _go.router.goNamed(FailureInternet.name);
//     }
//   }
// }

// class UserAgentInterceptor extends BaseInterceptor {
//   UserAgentInterceptor(this.userAgent);

//   final String userAgent;

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     addHeaders(options, {'user-agent': userAgent});
//     handler.next(options);
//   }
// }

// class AcceptInterceptor extends InterceptorsWrapper {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers.addAll({
//       'accept': '*/*',
//       'accept-language': 'ru-RU',
//       'connection': 'keep-alive',
//     });
//     handler.next(options);
//   }
// }
