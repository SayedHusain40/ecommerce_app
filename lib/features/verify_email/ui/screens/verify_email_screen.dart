import 'package:ecommerce_app/core/helpers/countdown_timer_controller.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_state.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_cubit.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailScreen extends StatefulWidget {
  final bool sendEmailOnInit;

  const VerifyEmailScreen({super.key, this.sendEmailOnInit = false});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isResendEnabled = false;
  int remainingSeconds = 0;
  late final CountdownTimerController _countdown;
  late final VerifyEmailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<VerifyEmailCubit>();

    _countdown = CountdownTimerController(
      initialSeconds: 60,
      onTick: (seconds) => setState(() => remainingSeconds = seconds),
      onFinished: () => setState(() => isResendEnabled = true),
    );

    if (widget.sendEmailOnInit) {
      // came from register/login → send email + start countdown
      sendEmailVerification();
    } else {
      // app reopen → just enable resend, no email sent
      setState(() => isResendEnabled = true);
    }
  }

  void sendEmailVerification() async {
    await _cubit.senEmailVerification();
  }

  @override
  void dispose() {
    _countdown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppCustomAppBar(
        title: l10n.emailVerificationTitle,
        onBackPressed: () async {
          await context.read<VerifyEmailCubit>().logout();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mark_email_read_outlined, size: 90),
            const SizedBox(height: 24),
            Text(
              l10n.verifyYourEmail,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.verifyEmailSubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
              listener: (context, state) {
                state.whenOrNull(
                  sendEmailVerification: () {
                    _countdown.start();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.verificationEmailSentSuccess),
                      ),
                    );
                  },
                  sendEmailFailure: (appFailure) {
                    setState(() => isResendEnabled = true);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(appFailure.message)));
                  },
                );
              },
              builder: (context, state) {
                final isLoading = state is SendPasswordResetEmailLoading;

                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isResendEnabled && !isLoading
                            ? () async {
                                setState(() => isResendEnabled = false);
                                await context
                                    .read<VerifyEmailCubit>()
                                    .senEmailVerification();
                              }
                            : null,
                        child: isLoading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                isResendEnabled
                                    ? l10n.resendEmail
                                    : l10n.resendInSeconds(remainingSeconds),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
