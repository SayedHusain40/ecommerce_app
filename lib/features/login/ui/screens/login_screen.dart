import 'package:ecommerce_app/core/auth/widgets/auth_switch_header.dart';
import 'package:ecommerce_app/core/auth/widgets/google_auth_button.dart';
import 'package:ecommerce_app/core/auth/widgets/password_form_field.dart';
import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/app_toast.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/regex.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/login/logic/login_cubit.dart';
import 'package:ecommerce_app/features/login/logic/login_state.dart';
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

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SvgPicture.asset(AppImages.logo(brightness)),
            const SizedBox(height: 24),
            AuthSwitchHeader(
              title: l10n.login,
              promptText: l10n.dontHaveAccount,
              actionText: l10n.signup,
              onActionTap: () =>
                  context.pushReplacementNamed(RouteNames.registerScreen),
            ),
            const SizedBox(height: 32),
            BlocConsumer<LoginCubit, LoginState>(
              listenWhen: (previous, current) =>
                  current is LoginSuccess || current is LoginFailure,
              listener: (context, state) {
                state.whenOrNull(
                  loginSuccess: (message) async {
                    AppToast.success(context, message);
                    context.pushNamedAndRemoveUntil(
                      RouteNames.appAuthState,
                      arguments: true,
                      predicate: (route) => false,
                    );
                  },
                  loginFailure: (appFailure) {
                    AppToast.error(
                      context,
                      appFailure.message,
                      showAtTop: false,
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
                        PasswordFormField(
                          controller: cubit.passwordController,
                          isVisible: _isPasswordVisible,
                          hintText: l10n.enterYourPassword,
                          validator: (value) {
                            if (value.isNullOrEmpty()) {
                              return l10n.passwordRequired;
                            }
                            return null;
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
                        GoogleAuthButton(
                          label: l10n.loginWithGoogle,
                          isLoading: isLoading,
                          onPressed: () async =>
                              await cubit.continueWithGoogle(),
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
                    style: TextStyle(color: AppColors.whiteInDark(brightness)),
                  ),
                  TextSpan(
                    text: ' ${l10n.privacyPolicy} ',
                    style: const TextStyle(color: AppColors.blue),
                  ),
                  TextSpan(
                    text: l10n.andWord,
                    style: TextStyle(color: AppColors.whiteInDark(brightness)),
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
    );
  }
}
