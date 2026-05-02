import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio createDio() {
    final dio = Dio();

    const timeout = Duration(seconds: 30);

    // Default headers (static):
    // - Applied to ALL requests automatically
    // - Used for constant values (e.g., Accept, language, app version)
    dio.options
      ..baseUrl = ApiConstants.baseUrl
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout
      ..headers = {'Accept': 'application/json'};

    // Interceptors (dynamic):
    // - Runs BEFORE every request
    // - Used for logic (e.g., add/remove token, logging, error handling)
    // dio.interceptors.add(ApiInterceptors(secureStorageService));

    // ONLY in debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }

    return dio;
  }
}
