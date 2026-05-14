import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_cubit.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: AppTextStyles.button1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey50(brightness)),
      ),
    );

    return Scaffold(
      appBar: AppCustomAppBar(
        title: 'Forgot Password',
        actions: [
          RichText(
            text: TextSpan(
              text: '02/',
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
            verifyResetCodeSuccess: () {
              context.pushNamed(RouteNames.newPasswordScreen);
            },
            verifyResetCodeFailure: (failure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(failure.message)));
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<ForgotPasswordCubit>();
          final isLoading = state is VerifyResetCodeLoading;

          return Padding(
            padding: const .symmetric(horizontal: 16, vertical: 12),
            child: Form(
              key: cubit.pinFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Verification',
                    style: AppTextStyles.headingH2Bold,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Enter the 6-digit verification code send to your email address.',
                    style: AppTextStyles.body2Regular.copyWith(
                      color: AppColors.grey150(brightness),
                    ),
                  ),
                  SizedBox(height: 16),

                  Pinput(
                    length: 6,
                    controller: cubit.pinController,
                    focusNode: cubit.focusNode,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.cyan),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        // color: fillColor,
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    validator: (value) {
                      if (value.isNullOrEmpty()) {
                        return 'Please enter the code';
                      }
                      if (value!.length < 6) {
                        return 'Enter the full 6-digit code';
                      }
                      return null;
                    },
                    // hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                      cubit.verifyResetCode();
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                  ),

                  SizedBox(height: 16),
                  Align(
                    alignment: .center,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Resend Code',
                        style: AppTextStyles.body2Medium.copyWith(
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            await cubit.verifyResetCode();
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text('Proceed', style: AppTextStyles.button2),
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
