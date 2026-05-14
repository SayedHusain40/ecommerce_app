import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/regex.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_cubit.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppCustomAppBar(
        title: 'Create Password',
        actions: [
          RichText(
            text: TextSpan(
              text: '03/',
              style: AppTextStyles.body2Medium.copyWith(
                color: AppColors.whiteOrBlack(brightness),
              ),
              children: [
                TextSpan(
                  text: '03',
                  style: TextStyle(color: AppColors.grey100),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          state.whenOrNull(
            confirmPasswordResetSuccess: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
              // Pop back to login or navigate to success screen
              context.pushReplacementNamed(RouteNames.loginScreen);
            },
            confirmPasswordResetFailure: (failure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(failure.message)));
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<ForgotPasswordCubit>();
          final isLoading = state is ConfirmPasswordResetLoading;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Form(
              key: cubit.newPasswordFormKey,
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
                  const SizedBox(height: 24),

                  // ---------- Password ----------
                  RequiredLabel('Password'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: cubit.newPasswordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isNullOrEmpty()) {
                        return 'Password is required';
                      }
                      if (!Regex.isPasswordValid(value!)) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // ---------- Confirm Password ----------
                  RequiredLabel('Confirm Password'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: cubit.confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () => setState(
                          () => _obscureConfirmPassword =
                              !_obscureConfirmPassword,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isNullOrEmpty()) {
                        return 'Please confirm your password';
                      }
                      if (value != cubit.newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  // ---------- Save Button ----------
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              await cubit.confirmPasswordReset();
                            },
                      child: isLoading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text('Save', style: AppTextStyles.button1),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
