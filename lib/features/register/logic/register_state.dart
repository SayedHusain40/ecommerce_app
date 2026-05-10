import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;

  // Register
  const factory RegisterState.registerSuccess(String message) = RegisterSuccess;
  const factory RegisterState.registerLoading() = RegisterLoading;
  const factory RegisterState.registerFailure(AppFailure appFailure) = RegisterFailure;
}