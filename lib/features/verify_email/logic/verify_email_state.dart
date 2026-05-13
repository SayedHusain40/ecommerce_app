import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_state.freezed.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = _Initial;

  const factory VerifyEmailState.verifyEmailLoading() = Loading;
  const factory VerifyEmailState.sendEmailVerification() = SendEmailVerification;
  const factory VerifyEmailState.sendEmailFailure(AppFailure appFailure) = SendEmailFailure;

  const factory VerifyEmailState.logOutFailure() = LogOutFailure;
}