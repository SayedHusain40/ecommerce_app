import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_app/features/login/logic/login_cubit.dart';
import 'package:ecommerce_app/features/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/latest_products_cubit.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_cubit.dart';
import 'package:ecommerce_app/features/verify_email/ui/screens/verify_email_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppAuthState extends StatelessWidget {
  final bool sendEmailOnInit;

  const AppAuthState({super.key, this.sendEmailOnInit = false});

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
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        }

        // Logged in but not verified
        if (!user.emailVerified) {
          return BlocProvider(
            create: (context) => getIt<VerifyEmailCubit>(),
            child: VerifyEmailScreen(sendEmailOnInit: sendEmailOnInit),
          );
        }

        // Logged in and verified
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt<CategoryCubit>()..getCategories(),
            ),


            // Here i used "getProducts" because i want default is display "All" then user can select category
            BlocProvider(
              create: (_) => getIt<CategoryProductsCubit>()..getProducts(limit: 4),
            ),
            // for display latest products
            BlocProvider(
              create: (_) => getIt<LatestProductsCubit>()..getProducts(limit: 4),
            ),

          ],
          child: const HomeScreen(),
        );
      },
    );
  }
}
