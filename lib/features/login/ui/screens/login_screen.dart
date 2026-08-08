import 'package:ecommerce_app/core/constants/app_assets.dart';
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
                Text(l10n.login, style: AppTextStyles.headingH2Bold),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.dontHaveAccount,
                        style: AppTextStyles.body2Regular.copyWith(
                          color: AppColors.grey150(brightness),
                        ),
                      ),
                      TextSpan(
                        text: l10n.signup,
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
                const SizedBox(height: 32),
                BlocConsumer<LoginCubit, LoginState>(
                  listenWhen: (previous, current) =>
                      current is LoginSuccess || current is LoginFailure,
                  listener: (context, state) {
                    state.whenOrNull(
                      loginSuccess: (message) async {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                        context.pushNamedAndRemoveUntil(
                          RouteNames.appAuthState,
                          arguments: true,
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
                                    return null;
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            Align(
                              alignment: .topRight,
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    RouteNames.confirmationEmailScreenScreen,
                                  );
                                },
                                child: Text(
                                  l10n.forgotPassword,
                                  style: AppTextStyles.body2Medium.copyWith(
                                    color: AppColors.cyan,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      cubit.login();
                                    },
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : Text(l10n.login),
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
                                      l10n.loginWithGoogle,
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
                const SizedBox(height: 131),
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    style: AppTextStyles.body3SemiBold,
                    children: [
                      TextSpan(
                        text: l10n.byLoginAgreeTo,
                        style: TextStyle(
                          color: AppColors.whiteInDark(brightness),
                        ),
                      ),
                      TextSpan(
                        text: ' ${l10n.privacyPolicy} ',
                        style: const TextStyle(color: AppColors.blue),
                      ),
                      TextSpan(
                        text: l10n.andWord,
                        style: TextStyle(
                          color: AppColors.whiteInDark(brightness),
                        ),
                      ),
                      TextSpan(
                        text: ' ${l10n.termsAndConditions}. ',
                        style: const TextStyle(color: AppColors.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
