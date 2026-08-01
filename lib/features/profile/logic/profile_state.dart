import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  // Logout
  const factory ProfileState.logoutLoading() = _ProfileLogoutLoading;
  const factory ProfileState.logoutSuccess() = _ProfileLogoutSuccess;
  const factory ProfileState.logoutFailure(AppFailure appFailure) = _ProfileLogoutFailure;

  // Check current password (before allowing change)
  const factory ProfileState.checkPasswordLoading() = CheckPasswordLoading;
  const factory ProfileState.checkPasswordSuccess() = CheckPasswordSuccess;
  const factory ProfileState.checkPasswordFailure(AppFailure appFailure) = CheckPasswordFailure;

  // Change password
  const factory ProfileState.changePasswordLoading() = ChangePasswordLoading;
  const factory ProfileState.changePasswordSuccess() = ChangePasswordSuccess;
  const factory ProfileState.changePasswordFailure(AppFailure appFailure) = ChangePasswordFailure;
}