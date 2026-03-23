import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModule {
  @Named("TimeoutDio")
  Dio get timeoutDio =>
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
            compact: true,
            maxWidth: 90,
            enabled: kDebugMode,
            filter: (options, args) {
              // don't print requests with uris containing '/posts'
              if (options.path.contains('/posts')) {
                return false;
              }
              // don't print responses with unit8 list data
              return !args.isResponse || !args.hasUint8ListData;
            },
          ),
        );
}
