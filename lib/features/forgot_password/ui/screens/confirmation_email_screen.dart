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

class ConfirmationEmailScreen extends StatelessWidget {
  const ConfirmationEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppCustomAppBar(
        title: 'Forgot Password',
        actions: [
          RichText(
            text: TextSpan(
              text: '01/',
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
            sendPasswordResetEmailSuccess: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
              context.pushNamed(RouteNames.emailVerificationScreen);
            },
            sendPasswordResetEmailFailure: (failure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(failure.message)));
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<ForgotPasswordCubit>();
          final isLoading = state is SendPasswordResetEmailLoading;

          return Padding(
            padding: const .symmetric(horizontal: 16, vertical: 12),
            child: Form(
              key: cubit.emailFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirmation Email',
                    style: AppTextStyles.headingH2Bold,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Enter your email address for verification.',
                    style: AppTextStyles.body2Regular.copyWith(
                      color: AppColors.grey150(brightness),
                    ),
                  ),
                  SizedBox(height: 16),
                  RequiredLabel('Email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Enter your email'),
                    validator: (value) {
                      if (value.isNullOrEmpty()) {
                        return 'Email is required';
                      }
                      if (!Regex.isEmailValid(value!)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            await cubit.sendPasswordResetEmail();
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text('Send', style: AppTextStyles.button2),
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
