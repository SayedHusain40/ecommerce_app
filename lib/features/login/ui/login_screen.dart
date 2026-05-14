import 'package:ecommerce_app/core/constants/app_images.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/regex.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/login/logic/login_cubit.dart';
import 'package:ecommerce_app/features/login/logic/login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SvgPicture.asset(AppImages.logo(brightness)),
                SizedBox(height: 24),
                Text('Login', style: AppTextStyles.headingH2Bold),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: AppTextStyles.body2Regular.copyWith(
                          color: AppColors.grey150(brightness),
                        ),
                      ),
                      TextSpan(
                        text: 'Signup',
                        style: AppTextStyles.body2Medium.copyWith(
                          color: AppColors.cyan,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacementNamed(
                              RouteNames.registerScreen,
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                BlocConsumer<LoginCubit, LoginState>(
                  listenWhen: (previous, current) =>
                      current is LoginSuccess || current is LoginFailure,
                  listener: (context, state) {
                    state.whenOrNull(
                      loginSuccess: (message) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                        context.pushNamedAndRemoveUntil(
                          RouteNames.appAuthState,
                          predicate: (route) => false,
                        );
                      },
                      loginFailure: (appFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(appFailure.message)),
                        );
                      },
                    );
                  },
                  buildWhen: (previous, current) =>
                      current is LoginSuccess ||
                      current is LoginFailure ||
                      current is LoginLoading,
                  builder: (context, state) {
                    final cubit = context.read<LoginCubit>();
                    final isLoading = state is LoginLoading;
                    return Form(
                      key: cubit.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            SizedBox(height: 16),
                            RequiredLabel('Email'),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your email',
                              ),
                              validator: (value) {
                                if (value.isNullOrEmpty()) {
                                  return 'Email is Required';
                                }
                                if (!Regex.isEmailValid(value!)) {
                                  return 'Email is InValid';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            RequiredLabel('Password'),
                            SizedBox(height: 8),
                            ValueListenableBuilder(
                              valueListenable: _isPasswordVisible,
                              builder: (context, value, child) {
                                return TextFormField(
                                  controller: cubit.passwordController,
                                  obscureText: !value,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    suffixIcon: IconButton(
                                      onPressed: () =>
                                          _isPasswordVisible.value = !value,
                                      icon: SvgPicture.asset(
                                        value
                                            ? AppImages.eyeOpen(brightness)
                                            : AppImages.eyeOff(brightness),
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isNullOrEmpty()) {
                                      return 'Password is Required';
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 24),
                            Align(
                              alignment: .topRight,
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    RouteNames.confirmationEmailScreen,
                                  );
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: AppTextStyles.body2Medium.copyWith(
                                    color: AppColors.cyan,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      cubit.login();
                                    },
                              child: isLoading
                                  ? CircularProgressIndicator()
                                  : Text('Login'),
                            ),
                            SizedBox(height: 16),
                            TextButton(
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      await cubit.continueWithGoogle();
                                    },
                              child: Row(
                                mainAxisAlignment: .center,
                                crossAxisAlignment: .center,
                                children: [
                                  if (isLoading)
                                    CircularProgressIndicator()
                                  else ...[
                                    Text(
                                      'Login with Google',
                                      style: AppTextStyles.button2,
                                    ),
                                    SizedBox(width: 8),
                                    SvgPicture.asset(AppImages.googleLight),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 131),
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    style: AppTextStyles.body3SemiBold,
                    children: [
                      TextSpan(
                        text: 'By login , you agree to our',
                        style: TextStyle(
                          color: AppColors.whiteOrBlack(brightness),
                        ),
                      ),
                      TextSpan(
                        text: ' Privacy Policy ',
                        style: TextStyle(color: AppColors.blue),
                      ),
                      TextSpan(
                        text: 'and',
                        style: TextStyle(
                          color: AppColors.whiteOrBlack(brightness),
                        ),
                      ),
                      TextSpan(
                        text: ' Terms & Conditions. ',
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
