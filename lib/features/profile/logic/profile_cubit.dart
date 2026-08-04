import 'package:ecommerce_app/core/auth/repos/auth_repo.dart';
import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/profile/data/model/user_profile_model.dart';
import 'package:ecommerce_app/features/profile/data/repos/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepo authRepo;
  final ProfileRepo profileRepo;

  final formKey = GlobalKey<FormState>();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  ProfileCubit(this.authRepo, this.profileRepo)
    : super(const ProfileState.initial());

  Future<void> logout() async {
    emit(const ProfileState.logoutLoading());
    final result = await authRepo.logout();
    result.when(
      success: (_) {
        getIt<NavCubit>().reset();
        emit(const ProfileState.logoutSuccess());
      },
      failure: (appFailure) => emit(ProfileState.logoutFailure(appFailure)),
    );
  }

  UserProfileModel get userInfo => profileRepo.getUserInfo();

  Future<void> checkCurrentPassword() async {
    if (!formKey.currentState!.validate()) return;

    emit(const ProfileState.checkPasswordLoading());
    final result = await profileRepo.checkUserPassword(
      currentPassword: currentPasswordController.text,
    );
    result.when(
      success: (_) => emit(const ProfileState.checkPasswordSuccess()),
      failure: (appFailure) =>
          emit(ProfileState.checkPasswordFailure(appFailure)),
    );
  }

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;

    emit(const ProfileState.changePasswordLoading());
    final result = await profileRepo.changePassword(
      newPassword: newPasswordController.text,
    );
    result.when(
      success: (_) => emit(const ProfileState.changePasswordSuccess()),
      failure: (appFailure) =>
          emit(ProfileState.changePasswordFailure(appFailure)),
    );
  }

  void resetCheckPasswordState() {
    if (state is CheckPasswordFailure) {
      emit(const ProfileState.initial());
    }
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    conformPasswordController.dispose();
    return super.close();
  }
}
