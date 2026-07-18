import 'package:ecommerce_app/core/auth/models/user_credential_model.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRepo(this.firebaseAuth, this.googleSignIn);

  bool get isEmailVerified => 
    firebaseAuth.currentUser?.emailVerified ?? false;

  Future<AppResult<UserCredentialModel>> continueWithGoogle() async {
    try {
      final googleUser = await googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final response = await firebaseAuth.signInWithCredential(credential);

      final user = response.user;

      if (user == null) {
        throw UserNullException;
      }

      final userCredentialModel = UserCredentialModel(
        uid: user.uid,
        fullName: user.displayName,
        email: user.email,
      );

      return AppResult.success(userCredentialModel);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

  Future<AppResult<void>> logout() async {
    try {
      await firebaseAuth.signOut();
      return const AppResult.success(null);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }
}
