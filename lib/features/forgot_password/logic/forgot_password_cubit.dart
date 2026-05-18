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
  final emailController = TextEditingController();

  Future<void> sendPasswordResetEmail() async {
    if (!emailFormKey.currentState!.validate()) return;

    emit(ForgotPasswordState.sendPasswordResetEmailLoading());

    final result = await forgotPasswordRepo.sendPasswordResetEmail(
      email: emailController.text,
    );

    result.when(
      success: (_) => emit(
        ForgotPasswordState.sendPasswordResetEmailSuccess(
          'Check your inbox — a reset link was sent to ${emailController.text}',
        ),
      ),
      failure: (appFailure) =>
          emit(ForgotPasswordState.sendPasswordResetEmailFailure(appFailure)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
