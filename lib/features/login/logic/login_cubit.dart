import 'package:ecommerce_app/core/auth/models/user_request_model.dart';
import 'package:ecommerce_app/core/auth/repos/auth_repo.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/login/data/repos/login_repo.dart';
import 'package:ecommerce_app/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final AuthRepo authRepo;

  LoginCubit(this.loginRepo, this.authRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void resetState() {
    emailController.clear();
    passwordController.clear();
    emit(const LoginState.initial());
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(const LoginState.loginLoading());

    final userRequestModel = UserRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final result = await loginRepo.signInWithEmailAndPassword(userRequestModel);

    result.when(
      success: (data) {
        if (isClosed) return;
        emit(const LoginState.loginSuccess('Login Successfully'));
      },
      failure: (appFailure) {
        emit(LoginState.loginFailure(appFailure));
      },
    );
  }

  Future<void> continueWithGoogle() async {
    emit(const LoginState.loginLoading());

    final result = await authRepo.continueWithGoogle();

    result.when(
      success: (data) {
        emit(const LoginState.loginSuccess('Login Successfully'));
      },
      failure: (appFailure) {
        emit(LoginState.loginFailure(appFailure));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
