import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.sendPasswordResetEmailLoading() = SendPasswordResetEmailLoading;
  const factory ForgotPasswordState.sendPasswordResetEmailSuccess(String message) = SendPasswordResetEmailSuccess;
  const factory ForgotPasswordState.sendPasswordResetEmailFailure(AppFailure appFailure) = SendPasswordResetEmailFailure;
}