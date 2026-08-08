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
    final brightness = context.brightness;
    final l10n = context.l10n;

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
                Text(l10n.signup, style: AppTextStyles.headingH2Bold),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.alreadyHaveAccount,
                        style: AppTextStyles.body2Regular.copyWith(
                          color: AppColors.grey150(brightness),
                        ),
                      ),
                      TextSpan(
                        text: l10n.login,
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
                            RequiredLabel(l10n.fullName),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.nameController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: l10n.enterYourName,
                              ),
                              validator: (value) {
                                if (value.isNullOrEmpty()) {
                                  return l10n.nameRequired;
                                }
                                if (!Regex.isAlphaOnly(value!)) {
                                  return l10n.nameAlphaOnly;
                                }
                                if (value.trim().length < 3) {
                                  return l10n.nameMinLength;
                                }
                                if (value.trim().length > 50) {
                                  return l10n.nameMaxLength;
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            RequiredLabel(l10n.email),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.emailController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: l10n.enterYourEmail,
                              ),
                              validator: (value) {
                                if (value.isNullOrEmpty()) {
                                  return l10n.emailRequired;
                                }
                                if (!Regex.isEmailValid(value!)) {
                                  return l10n.emailInvalid;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            RequiredLabel(l10n.password),
                            const SizedBox(height: 8),
                            ValueListenableBuilder(
                              valueListenable: _isPasswordVisible,
                              builder: (context, value, child) {
                                return TextFormField(
                                  controller: cubit.passwordController,
                                  obscureText: !value,
                                  decoration: InputDecoration(
                                    hintText: l10n.enterYourPassword,
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
                                      return l10n.passwordRequired;
                                    }

                                    final List<String> errors = [
                                      if (!Regex.hasMinLength(value!))
                                        l10n.passwordMinLength,
                                      if (!Regex.hasUpperCase(value))
                                        l10n.passwordUppercase,
                                      if (!Regex.hasLowerCase(value))
                                        l10n.passwordLowercase,
                                      if (!Regex.hasNumber(value))
                                        l10n.passwordNumber,
                                      if (!Regex.hasSpecialCharacter(value))
                                        l10n.passwordSpecialChar,
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
                                  : Text(l10n.createAccount),
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
                                      l10n.signupWithGoogle,
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
