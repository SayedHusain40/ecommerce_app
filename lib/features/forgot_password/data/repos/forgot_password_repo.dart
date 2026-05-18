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

}
