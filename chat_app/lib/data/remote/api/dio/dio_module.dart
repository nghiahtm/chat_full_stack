import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/core/interceptor/authorize_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModule {
  @Named("DioNonAuthen")
  Dio get dioNonAuthen =>
      Dio(
          BaseOptions(
            connectTimeout: const Duration(minutes: 1),
            receiveTimeout: const Duration(minutes: 1),
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            enabled: kDebugMode,
          ),
        );

  @Named("Authorization")
  Dio get dioAuth {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(minutes: 1),
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        enabled: kDebugMode,
      ),
    );
    dio.interceptors.add(getIt<AuthorizeInterceptor>());
    return dio;
  }
}
