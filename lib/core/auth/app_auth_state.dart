import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/features/home/ui/home_screen.dart';
import 'package:ecommerce_app/features/register/logic/register_cubit.dart';
import 'package:ecommerce_app/features/register/ui/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppAuthState extends StatelessWidget {
  const AppAuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;

        // Not logged in
        if (user == null) {
          return BlocProvider(
            create: (_) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          );
        }

        // Logged in but not verified
        if (!user.emailVerified) {

        }

        // Logged in and verified
        return const HomeScreen();
      },
    );
  }
}
