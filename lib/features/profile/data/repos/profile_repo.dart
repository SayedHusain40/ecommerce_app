import 'package:ecommerce_app/core/auth/models/user_credential_model.dart';
import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/profile/data/model/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepo {
  final FirebaseAuth firebaseAuth;

  ProfileRepo(this.firebaseAuth);

  Future<AppResult<void>> checkUserPassword({
    required String currentPassword,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null || user.email == null) {
      throw UserNullException;
    }

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    try {
      // This throws if currentPassword is wrong
      await user.reauthenticateWithCredential(credential);

      // Only reached if currentPassword was correct
      // await user.updatePassword(newPassword);
      return const AppResult.success(null);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

  Future<AppResult<void>> changePassword({required String newPassword}) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw UserNullException;
    }
    try {
      await user.updatePassword(newPassword);
      return const AppResult.success(null);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

  UserProfileModel getUserInfo() {
    final User? user = firebaseAuth.currentUser;

    if (user == null) {
      return const UserProfileModel();
    }
    return UserProfileModel(
      name: user.displayName!,
      email: user.email!,
      photoUrl: user.photoURL,
    );
  }
}
