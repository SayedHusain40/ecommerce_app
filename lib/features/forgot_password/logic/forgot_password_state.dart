import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;

  // sendPasswordResetEmail
  const factory ForgotPasswordState.sendPasswordResetEmailLoading() = SendPasswordResetEmailLoading;
  const factory ForgotPasswordState.sendPasswordResetEmailSuccess(String message) = SendPasswordResetEmailSuccess;
  const factory ForgotPasswordState.sendPasswordResetEmailFailure(AppFailure appFailure) = SendPasswordResetEmailFailure;

  // verifyResetCode 
  const factory ForgotPasswordState.verifyResetCodeLoading() = VerifyResetCodeLoading;
  const factory ForgotPasswordState.verifyResetCodeSuccess() = VerifyResetCodeSuccess;
  const factory ForgotPasswordState.verifyResetCodeFailure(AppFailure appFailure) = VerifyResetCodeFailure;

  // confirmPasswordReset
  const factory ForgotPasswordState.confirmPasswordResetLoading() = ConfirmPasswordResetLoading;
  const factory ForgotPasswordState.confirmPasswordResetSuccess(String message) = ConfirmPasswordResetSuccess;
  const factory ForgotPasswordState.confirmPasswordResetFailure(AppFailure appFailure) = ConfirmPasswordResetFailure;
}