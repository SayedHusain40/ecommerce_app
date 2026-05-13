import 'package:ecommerce_app/core/auth/models/user_credential_model.dart';
import 'package:ecommerce_app/core/auth/models/user_request_model.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  final FirebaseAuth firebaseAuth;

  LoginRepo(this.firebaseAuth);

  Future<AppResult<UserCredentialModel>> signInWithEmailAndPassword(
    UserRequestModel userRequestModel,
  ) async {
    try {
      final UserCredential response = await firebaseAuth
          .signInWithEmailAndPassword(
            email: userRequestModel.email,
            password: userRequestModel.password,
          );

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
  
}
