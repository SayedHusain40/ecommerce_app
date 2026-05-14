import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/forgot_password/data/repos/forgot_password_repo.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo forgotPasswordRepo;

  ForgotPasswordCubit(this.forgotPasswordRepo)
    : super(ForgotPasswordState.initial());

  final emailFormKey = GlobalKey<FormState>();
  final pinFormKey = GlobalKey<FormState>();
  final newPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final focusNode = FocusNode();

  void resetState() {
    emailController.clear();
    emit(ForgotPasswordState.initial());
  }

  Future<void> sendPasswordResetEmail() async {
    if (!emailFormKey.currentState!.validate()) {
      return;
    }
    emit(SendPasswordResetEmailLoading());

    final result = await forgotPasswordRepo.sendPasswordResetEmail(
      email: emailController.text,
    );

    result.when(
      success: (data) {
        emit(
          SendPasswordResetEmailSuccess(
            'If ${emailController.text} is linked to an account, a password reset link has been sent. Check your inbox or spam folder.',
          ),
        );
      },
      failure: (appFailure) {
        emit(SendPasswordResetEmailFailure(appFailure));
      },
    );
  }

  Future<void> verifyResetCode() async {
    if (!pinFormKey.currentState!.validate()) return;
    emit(ForgotPasswordState.verifyResetCodeLoading());

    final result = await forgotPasswordRepo.verifyResetCode(
      code: pinController.text,
    );

    result.when(
      success: (_) => emit(ForgotPasswordState.verifyResetCodeSuccess()),
      failure: (appFailure) =>
          emit(ForgotPasswordState.verifyResetCodeFailure(appFailure)),
    );
  }

  Future<void> confirmPasswordReset() async {
    if (!newPasswordFormKey.currentState!.validate()) return;

    emit(ForgotPasswordState.confirmPasswordResetLoading());

    final result = await forgotPasswordRepo.confirmPasswordReset(
      code: pinController.text,
      newPassword: newPasswordController.text,
    );

    result.when(
      success: (data) {
        emit(
          ForgotPasswordState.confirmPasswordResetSuccess(
            'Password reset successfully.',
          ),
        );
      },
      failure: (appFailure) {
        emit(ForgotPasswordState.confirmPasswordResetFailure(appFailure));
      },
    );
  }

  @override
  Future<void> close() {
    pinController.dispose();
    focusNode.dispose();
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
