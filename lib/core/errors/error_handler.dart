import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/network/api/api_error_model.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ErrorHandler {

    // ---------------- Main ----------------
  static AppFailure handle(dynamic e, [StackTrace? stackTrace]) {
    if (kDebugMode) {
      debugPrint("Exception: $e");
      if (stackTrace != null) debugPrint(stackTrace.toString());
    }

    // ---------------- DioException ----------------
    if (e is DioException) return _handleDio(e);

    // ---------------- CacheException ----------------
    if (e is CacheException) return _handleCache(e);

    // ---------------- FirebaseAuthException ----------------
    if (e is FirebaseAuthException) {
      if (kDebugMode) {
        debugPrint("FirebaseAuthException: ${e.code}");
        debugPrint("Message: ${e.message}");
      }
      return AppFailure(
        message:
            _firebaseAuthMessages[e.code] ??
            'Authentication error occurred.',
        code: e.code,
      );
    }

    // ---------------- FirebaseException ----------------
    if (e is FirebaseException) {
      if (kDebugMode) {
        debugPrint("FirebaseException: ${e.code}");
        debugPrint("Message: ${e.message}");
      }
      return AppFailure(
        message:
            _firebaseMessages[e.code] ??
            'Firebase error occurred.',
        code: e.code,
      );
    }

    // ---------------- GoogleSignInException ----------------
    if (e is GoogleSignInException) {
      if (kDebugMode) {
        debugPrint("GoogleSignInException: ${e.code}");
        debugPrint("Description: ${e.description}");
        debugPrint("Details: ${e.details}");
      }
      return AppFailure(
        message:
            _googleSignInMessages[e.code] ??
            'Unable to sign in with Google. Please try again.',
      );
    }

    // ---------------- CustomExceptions ----------------
    if (e is UserNullException) {
      return const AppFailure(
        message: "Something went wrong. Please try again.",
      );
    }

    // if (e is UserNotLoggedInException) {
    //   return const AppFailure(message: "User not logged in");
    // }

    // if (e is UserSessionExpiredException) {
    //   return const AppFailure(message: "User session expired");
    // }

    // if (e is EmailAlreadyVerifiedException) {
    //   return const AppFailure(message: "Email is already verified");
    // }

    // ---------------- Unknown Error ----------------
    return const AppFailure(message: "Something went wrong.");
  }

  
  // ---------------- FirebaseAuth ----------------
  static const Map<String, String> _firebaseAuthMessages = {
    // For Login
    'invalid-credential': 'Invalid email or password.', // ✅
    'user-not-found': 'Invalid email or password.', // for old sdk
    'wrong-password': 'Invalid email or password.', // for old sdk
    'user-disabled': 'This account has been disabled.', // ✅
    'too-many-requests':
        'Too many attempts. Please try again later.', // ✅ for invalid-credential i test it

    // For SignUp
    'weak-password': 'The password provided is too weak.', // ✅
    'email-already-in-use': 'The account already exists for that email.', // ✅

    // For Both Login and SignUp
    'invalid-email': 'The email address is not valid.', // ✅
    'network-request-failed': 'No internet connection', // ✅

    // Others
    'operation-not-allowed': 'This sign-in method is not allowed.',
    'requires-recent-login': 'Please re-login to verify your email.',

    // If Empty Input
    'channel-error': 'Invalid input. Please check Your Inputs.',

    // Password Reset & Email Actions
    'expired-action-code': 'This link has expired. Please request a new one.',
    'invalid-action-code': 'This link is invalid or has already been used.',

    // Phone Auth
    'invalid-verification-code':
        'The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again',
    'invalid-phone-number': 'Phone number format is invalid.',
    // 'invalid-verification-id': 'Invalid verification ID.',

    // Custom token / OAuth
    // 'custom-token-mismatch': 'The custom token is for a different Firebase app.',
    // 'invalid-custom-token': 'The custom token is invalid.',
    'account-exists-with-different-credential':
        'An account already exists with a different sign-in method.',

    // Password reset : can handle these if needed
    // 'missing-android-pkg-name': '',
    // 'missing-continue-uri': '',
    // 'missing-ios-bundle-id': '',
    // 'invalid-continue-uri': '',
    // 'unauthorized-continue-uri': '',
  };

  // ---------------- Firebase Core / Firestore Messages ----------------
  static const Map<String, String> _firebaseMessages = {
    'permission-denied': 'You do not have permission to perform this action.',
    'unavailable': 'Service is currently unavailable. Please try again later.',
    'not-found': 'Requested data was not found.',
    'already-exists': 'This data already exists.',
    'cancelled': 'Request was cancelled.',
    'deadline-exceeded': 'Request timeout. Please try again.',
    'resource-exhausted': 'Too many requests. Please wait and try again.',
    'invalid-argument': 'Invalid data provided.',
    'failed-precondition': 'Operation failed due to system state.',
    'aborted': 'Operation was aborted. Please retry.',
    'out-of-range': 'Operation is out of valid range.',
    'unimplemented': 'This operation is not implemented.',
    'internal': 'Internal server error. Please try again.',
    'data-loss': 'Data loss occurred. Please try again.',
    'unauthenticated': 'User is not authenticated.',
  };

  // ---------------- Google Sign-In Messages ----------------
  static const Map<GoogleSignInExceptionCode, String> _googleSignInMessages = {
    GoogleSignInExceptionCode.canceled: 'Sign-in cancelled by user.',
    // not need show everything to user
    // GoogleSignInExceptionCode.clientConfigurationError: 'Client configuration error. Check your setup.',
    // GoogleSignInExceptionCode.interrupted: 'Sign-in was interrupted. Please retry.',
    // GoogleSignInExceptionCode.providerConfigurationError: 'Provider configuration error. Check your Firebase setup.',
    // GoogleSignInExceptionCode.uiUnavailable: 'Sign-in UI not available on this device.',
    // GoogleSignInExceptionCode.userMismatch: 'Signed in user does not match previous session.',
    GoogleSignInExceptionCode.unknownError:
        'An unknown error occurred during google sign-in.',
  };



  // ---------------- CacheException ----------------
  static AppFailure _handleCache(CacheException e) {
    if (kDebugMode) {
      debugPrint("CacheException: ${e.message}");
    }
    return const AppFailure(
      message:
          "No internet connection and no cached data available.",
    );
  }

  // ---------------- DioException ----------------
  static AppFailure _handleDio(DioException e) {
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
        return const AppFailure(
          message: "No internet connection.",
        );

      case DioExceptionType.cancel:
        return const AppFailure(
          message: "Request was cancelled.",
        );

      case DioExceptionType.badCertificate:
        return const AppFailure(
          message: "Secure connection failed.",
        );

      case DioExceptionType.badResponse:
        final data = e.response?.data;

        if (data is Map<String, dynamic>) {
          try {
            final apiErrorModel = ApiErrorModel.fromJson(data);
            return AppFailure(
              message:
                  apiErrorModel.message ??
                  "An unexpected error occurred.",
              statusCode: e.response?.statusCode,
            );
          } catch (parseError) {
            if (kDebugMode) {
              debugPrint(
                  "Failed to parse error response: $parseError");
            }
          }
        }

        return const AppFailure(
          message: "Server error. Please try again.",
        );

      case DioExceptionType.unknown:
        return const AppFailure(
          message: "Something went wrong.",
        );
    }
  }
}