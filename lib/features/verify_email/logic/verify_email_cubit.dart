import 'package:ecommerce_app/core/auth/repos/auth_repo.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/verify_email/data/repos/verify_email_repo.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailRepo verifyEmailRepo;
  final AuthRepo authRepo;

  VerifyEmailCubit(this.verifyEmailRepo, this.authRepo)
    : super(VerifyEmailState.initial());

  Future<void> senEmailVerification() async {
    final result = await verifyEmailRepo.senEmailVerification();

    result.when(
      success: (data) {
        emit(VerifyEmailState.sendEmailVerification());
      },
      failure: (appFailure) {
        emit(VerifyEmailState.sendEmailVerification());
      },
    );
  }

  Future<void> logout() async {
    final result = await authRepo.logout();

    result.when(
      success: (data) {
        emit(VerifyEmailState.initial());
      },
      failure: (appFailure) {
        emit(VerifyEmailState.logOutFailure());
      },
    );
  }
}
