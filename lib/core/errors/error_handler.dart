import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/network/api/api_error_model.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  static AppFailure handle(dynamic e) {
    if (e is DioException) return _handleDio(e);
    if (e is CacheException) return _handleCache(e);

    if (kDebugMode) {
      debugPrint("Exception: $e");
    }
    return const AppFailure(message: "Something went wrong.");
  }
}

// CacheException
AppFailure _handleCache(CacheException e) {
  if (kDebugMode) {
    debugPrint("CacheException: ${e.message}");
  }
  return const AppFailure(message: "No internet connection and no cached data available.");
}

// DioException
AppFailure _handleDio(DioException e) {
  if (kDebugMode) {
    debugPrint("========== DioException ==========");
    debugPrint("Type: ${e.type}");
    debugPrint("Code: ${e.response?.statusCode}");
    debugPrint("Message: ${e.message}");
    debugPrint("===============================");
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const AppFailure(
        message: "Connection timed out. Please try again.",
      );
    case DioExceptionType.connectionError:
      return const AppFailure(message: "No internet connection.");
    case DioExceptionType.cancel:
      return const AppFailure(message: "Request was cancelled.");
    case DioExceptionType.badCertificate:
      return const AppFailure(message: "Secure connection failed.");
    case DioExceptionType.badResponse:
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        try {
          final apiErrorModel = ApiErrorModel.fromJson(data);
          return AppFailure(
            message: apiErrorModel.message ?? "An unexpected error occurred.",
            statusCode: e.response?.statusCode,
          );
        } catch (parseError) {
          if (kDebugMode) {
            debugPrint("Failed to parse error response: $parseError");
          }
        }
      }
      return const AppFailure(message: "Server error. Please try again.");
    case DioExceptionType.unknown:
      return const AppFailure(message: "Something went wrong.");
  }
}
