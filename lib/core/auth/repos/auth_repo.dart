import 'package:ecommerce_app/core/auth/models/user_credential_model.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/network/api/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRepo(this.firebaseAuth, this.googleSignIn);

  Future<Result<UserCredentialModel>> continueWithGoogle() async {
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

      return Result.success(userCredentialModel);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return Result.failure(failure);
    }
  }
}
