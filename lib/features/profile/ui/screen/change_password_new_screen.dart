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

    return Scaffold(
      appBar: AppCustomAppBar(
        title: 'Change Password',
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
              Text('New Password', style: AppTextStyles.headingH2Bold),
              const SizedBox(height: 8),
              Text(
                'Enter your new password and remember it.',
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
                        const SnackBar(
                          content: Text('Your Password Changed Successfully'),
                        ),
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
                        const RequiredLabel('Password'),
                        const SizedBox(height: 8),
                        ValueListenableBuilder(
                          valueListenable: _isNewPasswordVisible,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: cubit.newPasswordController,
                              obscureText: !value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
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
                        const SizedBox(height: 16),
                        const RequiredLabel('Confirm Password'),
                        const SizedBox(height: 8),
                        ValueListenableBuilder(
                          valueListenable: _isConformPasswordVisible,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: cubit.conformPasswordController,
                              obscureText: !value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
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
                                  return 'Conform Password is Required';
                                }
                                if (cubit.newPasswordController.text !=
                                    cubit.conformPasswordController.text) {
                                  return 'Passwords not Match';
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
                              : const Text('Save'),
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
