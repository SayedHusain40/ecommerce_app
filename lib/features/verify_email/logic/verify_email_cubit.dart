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
    if (authRepo.isEmailVerified) return; // already verified, skip

    final result = await verifyEmailRepo.senEmailVerification();

    result.when(
      success: (data) {
        if (isClosed) return;
        emit(VerifyEmailState.sendEmailVerification());
      },
      failure: (appFailure) {
        if (isClosed) return;
        emit(VerifyEmailState.sendEmailFailure(appFailure));
      },
    );
  }

  Future<void> logout() async {
    final result = await authRepo.logout();

    result.when(
      success: (data) {
        if (isClosed) return;
        emit(VerifyEmailState.initial());
      },
      failure: (appFailure) {
        if (isClosed) return;
        emit(VerifyEmailState.logOutFailure());
      },
    );
  }
}
