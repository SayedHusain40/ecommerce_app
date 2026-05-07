import 'package:ecommerce_app/core/auth/models/user_request_model.dart';
import 'package:ecommerce_app/core/auth/repos/auth_repo.dart';
import 'package:ecommerce_app/core/network/api/result.dart';
import 'package:ecommerce_app/features/register/data/repos/register_repo.dart';
import 'package:ecommerce_app/features/register/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  final AuthRepo authRepo;

  RegisterCubit(this.registerRepo, this.authRepo)
    : super(RegisterState.initial());

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterState.registerLoading());

    final userRequestModel = UserRequestModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    final result = await registerRepo.createUserWithEmailAndPassword(
      userRequestModel,
    );

    result.when(
      success: (data) {
        emit(RegisterState.registerSuccess('Register Successfully'));
      },
      failure: (appFailure) {
        emit(RegisterState.registerFailure(appFailure));
      },
    );
  }

  Future<void> continueWithGoogle() async {
    emit(RegisterState.registerLoading());

    final result = await authRepo.continueWithGoogle();

    result.when(
      success: (data) {
        emit(RegisterState.registerSuccess('Register Successfully'));
      },
      failure: (appFailure) {
        emit(RegisterState.registerFailure(appFailure));
      },
    );
  }

}
