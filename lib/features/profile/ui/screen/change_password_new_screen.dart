import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/regex.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/logic/profile_state.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordNewScreen extends StatefulWidget {
  const ChangePasswordNewScreen({super.key});

  @override
  State<ChangePasswordNewScreen> createState() =>
      _ChangePasswordNewScreenState();
}

class _ChangePasswordNewScreenState extends State<ChangePasswordNewScreen> {
  final _isNewPasswordVisible = ValueNotifier<bool>(false);
  final _isConformPasswordVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isNewPasswordVisible.dispose();
    _isConformPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final cubit = context.read<ProfileCubit>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppCustomAppBar(
        title: l10n.changePassword,
        actions: [
          Text('02/', style: AppTextStyles.body2Medium),
          Text(
            '02',
            style: AppTextStyles.body2Medium.copyWith(color: AppColors.grey100),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.newPassword, style: AppTextStyles.headingH2Bold),
              const SizedBox(height: 8),
              Text(
                l10n.newPasswordSubtitle,
                style: AppTextStyles.body2Regular.copyWith(
                  color: AppColors.grey150(brightness),
                ),
              ),
              const SizedBox(height: 16),
              BlocConsumer<ProfileCubit, ProfileState>(
                listenWhen: (previous, current) =>
                    current is ChangePasswordSuccess ||
                    current is ChangePasswordFailure,
                listener: (context, state) {
                  state.whenOrNull(
                    changePasswordSuccess: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.passwordChangedSuccess)),
                      );
                      cubit.logout();
                      context.pushNamedAndRemoveUntil(
                        RouteNames.appAuthState,
                        predicate: (route) => false,
                      );
                    },
                    changePasswordFailure: (AppFailure appFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(appFailure.message)),
                      );

                      // Force the form to re-run the validator now that
                      // cubit.state reflects the failure.
                      cubit.formKey.currentState?.validate();
                    },
                  );
                },
                buildWhen: (previous, current) =>
                    current is ChangePasswordLoading ||
                    current is ChangePasswordSuccess ||
                    current is ChangePasswordFailure,
                builder: (context, state) {
                  final isLoading = state is ChangePasswordLoading;

                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequiredLabel(l10n.password),
                        const SizedBox(height: 8),
                        ValueListenableBuilder(
                          valueListenable: _isNewPasswordVisible,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: cubit.newPasswordController,
                              obscureText: !value,
                              decoration: InputDecoration(
                                hintText: l10n.enterYourPassword,
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      _isNewPasswordVisible.value = !value,
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
                              onChanged: (_) {},
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
                        const SizedBox(height: 16),
                        RequiredLabel(l10n.confirmPassword),
                        const SizedBox(height: 8),
                        ValueListenableBuilder(
                          valueListenable: _isConformPasswordVisible,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: cubit.conformPasswordController,
                              obscureText: !value,
                              decoration: InputDecoration(
                                hintText: l10n.enterYourPassword,
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      _isConformPasswordVisible.value = !value,
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
                              onChanged: (_) {},
                              validator: (value) {
                                if (value.isNullOrEmpty()) {
                                  return l10n.confirmPasswordRequired;
                                }
                                if (cubit.newPasswordController.text !=
                                    cubit.conformPasswordController.text) {
                                  return l10n.passwordsNotMatch;
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: isLoading ? null : cubit.changePassword,
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : Text(l10n.save),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}