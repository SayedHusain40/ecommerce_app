import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordRepo {
  final FirebaseAuth firebaseAuth;

  ForgotPasswordRepo(this.firebaseAuth);

  Future<AppResult<void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);

      return AppResult.success(null);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

  Future<AppResult<void>> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    try {
      await firebaseAuth.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );

      return AppResult.success(null);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

  // In ForgotPasswordRepo
  Future<AppResult<void>> verifyResetCode({required String code}) async {
    try {
      await FirebaseAuth.instance.verifyPasswordResetCode(code);
      return const AppResult.success(null);
    } on FirebaseAuthException catch (e) {
      return AppResult.failure(
        AppFailure(message: e.message ?? 'Invalid code'),
      );
    }
  }
}
