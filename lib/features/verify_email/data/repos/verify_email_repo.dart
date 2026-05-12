import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailRepo {
  final FirebaseAuth firebaseAuth;

  VerifyEmailRepo(this.firebaseAuth);

  Future<AppResult<void>> senEmailVerification() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        throw UserNullException;
      }

      if (user.emailVerified) {
        return AppResult.success(null);
      }

      await firebaseAuth.currentUser!.sendEmailVerification();
      return AppResult.success(null);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }
}
