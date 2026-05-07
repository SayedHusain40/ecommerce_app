import 'package:ecommerce_app/core/constants/app_images.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/regex.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/register/logic/register_cubit.dart';
import 'package:ecommerce_app/features/register/logic/register_state.dart';
import 'package:ecommerce_app/features/register/ui/widgets/required_lable.dart';
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
                SizedBox(height: 24),
                Text('Signup', style: AppTextStyles.headingH2Bold),
                SizedBox(height: 8),
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
                SizedBox(height: 32),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listenWhen: (previous, current) =>
                      current is RegisterSuccess || current is RegisterFailure,
                  listener: (context, state) {
                    state.whenOrNull(
                      registerSuccess: (message) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
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
                            RequiredLabel('Full Name'),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your name',
                              ),
                              validator: (value) {
                                if (value.isNullOrEmpty()) {
                                  return 'Name is Required';
                                }
                                return null;
                              },
                            ),
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
                                    if (value == null || value.length <= 5) {
                                      return 'Password should be At least 6 characters';
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      cubit.register();
                                    },
                              child: isLoading
                                  ? CircularProgressIndicator()
                                  : Text('Create Account'),
                            ),
                            SizedBox(height: 16),
                            Container(
                              height: 60,
                              alignment: .center,
                              padding: .symmetric(horizontal: 10),
                              child: TextButton(
                                onPressed: isLoading
                                    ? null
                                    : () async {
                                        await cubit.continueWithGoogle();
                                      },
                                child: Row(
                                  mainAxisAlignment: .center,
                                  crossAxisAlignment: .center,
                                  mainAxisSize: .min,
                                  children: [
                                    isLoading
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'Signup with Google',
                                            style: AppTextStyles.button2
                                                .copyWith(
                                                  color: AppColors.whiteOrBlack(
                                                    brightness,
                                                  ),
                                                ),
                                          ),
                                    SizedBox(width: 8),
                                    SvgPicture.asset(AppImages.googleLight),
                                  ],
                                ),
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
