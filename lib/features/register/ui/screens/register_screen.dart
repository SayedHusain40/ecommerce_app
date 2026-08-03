import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/regex.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/register/logic/register_cubit.dart';
import 'package:ecommerce_app/features/register/logic/register_state.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                const SizedBox(height: 24),
                Text('Signup', style: AppTextStyles.headingH2Bold),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: AppTextStyles.body2Regular.copyWith(
                          color: AppColors.grey150(brightness),
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: AppTextStyles.body2Medium.copyWith(
                          color: AppColors.cyan,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacementNamed(
                              RouteNames.loginScreen,
                            );
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listenWhen: (previous, current) =>
                      current is RegisterSuccess || current is RegisterFailure,
                  listener: (context, state) {
                    state.whenOrNull(
                      registerSuccess: (message) async {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                        context.pushNamedAndRemoveUntil(
                          RouteNames.appAuthState,
                          arguments: true,
                          predicate: (route) => false,
                        );
                      },
                      registerFailure: (appFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(appFailure.message)),
                        );
                      },
                    );
                  },
                  buildWhen: (previous, current) =>
                      current is RegisterSuccess ||
                      current is RegisterFailure ||
                      current is RegisterLoading,
                  builder: (context, state) {
                    final cubit = context.read<RegisterCubit>();
                    final isLoading = state is RegisterLoading;
                    return Form(
                      key: cubit.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            const RequiredLabel('Full Name'),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your name',
                              ),
                              validator: (value) {
                                if (value.isNullOrEmpty()) {
                                  return 'Name is Required';
                                }
                                if (!Regex.isAlphaOnly(value!)) {
                                  return 'Name must contain letters only';
                                }
                                if (value.trim().length < 3) {
                                  return 'Name must be at least 3 characters';
                                }
                                if (value.trim().length > 50) {
                                  return 'Name must be at most 50 characters';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            const RequiredLabel('Email'),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.emailController,
                              decoration: const InputDecoration(
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
                            const SizedBox(height: 16),
                            const RequiredLabel('Password'),
                            const SizedBox(height: 8),
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
                                            ? AppIcons.eyeOpen(brightness)
                                            : AppIcons.eyeOff(brightness),
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

                                    final List<String> errors = [
                                      if (!Regex.hasMinLength(value!))
                                        '- Password must be at least 6 characters',
                                      if (!Regex.hasUpperCase(value))
                                        '- Must contain an uppercase letter',
                                      if (!Regex.hasLowerCase(value))
                                        '- Must contain a lowercase letter',
                                      if (!Regex.hasNumber(value))
                                        '- Must contain a number',
                                      if (!Regex.hasSpecialCharacter(value))
                                        '- Must contain a special character',
                                    ];

                                    if (errors.isNotEmpty) {
                                      return errors.join('\n');
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      cubit.register();
                                    },
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text('Create Account'),
                            ),
                            const SizedBox(height: 16),
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
                                    const CircularProgressIndicator()
                                  else ...[
                                    Text(
                                      'Signup with Google',
                                      style: AppTextStyles.button2,
                                    ),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(AppIcons.googleLight),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
