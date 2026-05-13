import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {

  const factory LoginState.initial() = _Initial;

  // Login
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(String message) = LoginSuccess;
  const factory LoginState.loginFailure(AppFailure appFailure) = LoginFailure;
}