import 'package:ecommerce_app/features/verify_email/logic/verify_email_cubit.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    super.initState();

    sendEmailVerification();
  }

  void sendEmailVerification() async {
    final cubit = context.read<VerifyEmailCubit>();

    await cubit.senEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mark_email_read_outlined, size: 90),
            const SizedBox(height: 24),

            const Text(
              'Verify Your Email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            const Text(
              'We sent a verification email to your email address.\nPlease check your inbox and verify your account.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40),

            BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
              listener: (context, state) {
                state.whenOrNull(
                  sendEmailVerification: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Send a verification email successfully'),
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await context.read<VerifyEmailCubit>().logout();
                    },
                    child: const Text('Login'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
