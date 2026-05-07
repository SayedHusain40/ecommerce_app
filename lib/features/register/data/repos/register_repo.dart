import 'package:ecommerce_app/core/auth/models/user_credential_model.dart';
import 'package:ecommerce_app/core/auth/models/user_request_model.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/network/api/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepo {
  final FirebaseAuth firebaseAuth;

  RegisterRepo(this.firebaseAuth);

  Future<Result<UserCredentialModel>> createUserWithEmailAndPassword(
    UserRequestModel userRequestModel,
  ) async {
    try {
      final UserCredential response = await firebaseAuth
          .createUserWithEmailAndPassword(
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

      return Result.success(userCredentialModel);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return Result.failure(failure);
    }
  }
  
}
