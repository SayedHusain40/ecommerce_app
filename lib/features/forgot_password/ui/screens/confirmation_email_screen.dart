import 'package:ecommerce_app/core/helpers/countdown_timer_controller.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/regex.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_cubit.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationEmailScreen extends StatefulWidget {
  const ConfirmationEmailScreen({super.key});

  @override
  State<ConfirmationEmailScreen> createState() =>
      _ConfirmationEmailScreenState();
}

class _ConfirmationEmailScreenState extends State<ConfirmationEmailScreen> {
  late final CountdownTimerController _countdown;
  bool isResendEnabled = true;
  int remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _countdown = CountdownTimerController(
      initialSeconds: 60,
      onTick: (seconds) => setState(() => remainingSeconds = seconds),
      onFinished: () => setState(() => isResendEnabled = true),
    );
  }

  @override
  void dispose() {
    _countdown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: const AppCustomAppBar(title: 'Forgot Password'),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          state.whenOrNull(
            sendPasswordResetEmailSuccess: (message) {
              setState(() => isResendEnabled = false);
              _countdown.start();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
              // context.pushNamedAndRemoveUntil(
              //   RouteNames.loginScreen,
              //   predicate: (route) => false,
              // );
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Form(
              key: cubit.emailFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirmation Email',
                    style: AppTextStyles.headingH2Bold,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter your email address for verification.',
                    style: AppTextStyles.body2Regular.copyWith(
                      color: AppColors.grey150(brightness),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const RequiredLabel('Email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: cubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
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
                    onPressed: (!isResendEnabled || isLoading)
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
                        : Text(
                            isResendEnabled
                                ? 'Resend Email'
                                : 'Resend in $remainingSeconds s',
                            style: AppTextStyles.button1,
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
