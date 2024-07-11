// import 'dart:async';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:kidneysmart/core/enum/enum_http_method.dart';
// import 'package:dartlog/dartlog.dart';
// import 'package:kidneysmart/core/service/network/dio_log/interceptor/dio_log_interceptor.dart';
// import 'package:kidneysmart/core/service/network/interceptor/auth/auth_interceptor.dart';
// import 'package:kidneysmart/core/service/network/interceptor/headers/accept_interceptor.dart';
// import 'package:kidneysmart/core/service/network/interceptor/error_handling/auth_error_interceptor.dart';
// import 'package:kidneysmart/core/service/network/interceptor/headers/content_type_interceptor.dart';
// import 'package:kidneysmart/core/service/network/interceptor/headers/user_agent_interceptor.dart';
// import 'package:kidneysmart/core/storage/app_storage.dart';
// import 'package:kidneysmart/navigation/app_router.dart';

// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'network_client.g.dart';

// @Riverpod(keepAlive: true)
// NetworkClient networkClient(NetworkClientRef ref) =>
//     throw UnimplementedError('init with override');

// class NetworkClient {
//   late final Dio _dio;
//   late final Dio _dio2;

//   final AppRouter _go;
//   final AppStorage _storage;

//   NetworkClient({
//     required AppRouter router,
//     required String userAgent,
//     required AppStorage storage,
//     Duration connectTimeout = const Duration(seconds: 30),
//     Duration receiveTimeout = const Duration(seconds: 55),
//   })  : _go = router,
//         _storage = storage {

//     _dio = Dio(
//       BaseOptions(
//         connectTimeout: connectTimeout,
//         receiveTimeout: receiveTimeout,
//       ),
//     )..interceptors.addAll([
//         DioLogInterceptor(),
//         ContentTypeInterceptor(),
//         AcceptInterceptor(),
//         UserAgentInterceptor(userAgent),
//       ]);

//     // Now that _dio2 is initialized, you can use it for _dio initialization
//     _dio = Dio(
//       BaseOptions(
//         connectTimeout: connectTimeout,
//         receiveTimeout: receiveTimeout,
//       ),
//     )..interceptors.addAll([
//         DioLogInterceptor(),
//         ContentTypeInterceptor(),
//         AcceptInterceptor(),
//         AuthErrorInterceptor(
//             router, _dio2, storage), // Here _dio2 is already initialized
//         AuthInterceptor(storage),
//         UserAgentInterceptor(userAgent),
//       ]);
//   }

//   Dio get dio => _dio;
//   // ignore: avoid_setters_without_getters
//   set isShowHttpInLog(bool value) => DioLogInterceptor.enablePrintLog = value;

//   Future<Response<T>> request<T>({
//     required EnumHttpMethod method,
//     required String url,
//     Map<String, dynamic>? params,
//     Options? options,
//     dynamic body,
//   }) async {
//     try {
//       switch (method) {
//         case EnumHttpMethod.post:
//           return await _dio.post<T>(
//             url,
//             queryParameters: params,
//             options: options,
//             data: body,
//           );
//         case EnumHttpMethod.get:
//           return await _dio.get<T>(
//             url,
//             queryParameters: params,
//             options: options,
//           );
//         case EnumHttpMethod.patch:
//           return await _dio.patch<T>(
//             url,
//             queryParameters: params,
//             options: options,
//             data: body,
//           );
//       }
//     } on DioException catch (e) {
//       return _handleDioException(e, url);
//       // Return an empty Response<T> in case of an error
//     } catch (e, stackTrace) {
//       return _handleGenericException(e, stackTrace, url);
//       // Re-throw or handle generic exceptions
//     }
//   }

//   Response<T> _handleDioException<T>(DioException e, String endPoint) {
//     // Log and report the error
//     Logger.debug(endPoint, e.error, e.stackTrace);
//     // ErrorHandler().reportError(e, e.stackTrace, severity: ErrorSeverity.warning);

//     // Default values for Response
//     var statusCode = 500; // Default status code for errors without a response
//     String? statusMessage = 'No response received';
//     T? responseData;

//     // Check if the response is available
//     if (e.response != null) {
//       statusCode = e.response!.statusCode ?? statusCode;
//       statusMessage = e.response!.statusMessage ?? statusMessage;

//       // Check if the data is of type T and assign it
//       if (e.response!.data != null && e.response!.data is T) {
//         responseData = e.response!.data as T;
//       } else {
//         // Handle cases where data is not of type T
//         // For example, log this situation or assign a default value
//       }
//     }

//     // Handle specific DioException types
//     if (e.type == DioExceptionType.connectionTimeout) {
//       // Handle connection timeout
//       _showError();
//     } else if (e.type == DioExceptionType.receiveTimeout) {
//       // Handle receive timeout
//       _showError();
//     }

//     // Return the Response object with appropriate data
//     return Response<T>(
//       requestOptions: RequestOptions(path: endPoint),
//       statusCode: statusCode,
//       statusMessage: statusMessage,
//       data: responseData,
//     );
//   }

//   Future<void> _showError() async {
//     // Implement error display logic here
//     // For example, show an error message or navigate to an error page
//     await Future<void>.delayed(const Duration(seconds: 0));
//     // _go.router.goNamed(FailureInternet.name);
//   }

//   Response<T> _handleGenericException<T>(
//     Object e,
//     StackTrace stackTrace,
//     String endPoint,
//   ) {
//     // Report the error to Firebase Crashlytics
//     // ErrorHandler().reportError(e, stackTrace);

//     // Log the error for debugging purposes
//     Logger.error('Unhandled error: $e', e, stackTrace);

//     // Perform additional actions based on the type of exception
//     if (e is SocketException) {
//       // Handle socket exception (like no internet connection)
//       _showError(); // Or any other appropriate action
//     } else {
//       _showError(); // Or any other appropriate action
//       // ...
//     }

//     // Return a Response object indicating an error
//     return Response<T>(
//       requestOptions: RequestOptions(path: endPoint),
//     );
//   }
// }
