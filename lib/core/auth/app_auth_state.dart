import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/navigation/main_nav_screen.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/login/logic/login_cubit.dart';
import 'package:ecommerce_app/features/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/latest_products_cubit.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_cubit.dart';
import 'package:ecommerce_app/features/verify_email/ui/screens/verify_email_screen.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppAuthState extends StatefulWidget {
  final bool sendEmailOnInit;

  const AppAuthState({super.key, this.sendEmailOnInit = false});

  @override
  State<AppAuthState> createState() => _AppAuthStateState();
}

class _AppAuthStateState extends State<AppAuthState> {
  late final Stream<User?> _authStream = FirebaseAuth.instance
      .authStateChanges();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStream,
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
            child: VerifyEmailScreen(sendEmailOnInit: widget.sendEmailOnInit),
          );
        }

        // Logged in and verified
        return MultiBlocProvider(
          providers: [
            // these 3 cubits for home screen
            BlocProvider(
              create: (_) => getIt<CategoryCubit>()..getCategories(),
            ),
            BlocProvider(
              create: (_) =>
                  getIt<LatestProductsCubit>()..getProducts(limit: 4),
            ),
            BlocProvider(
              create: (_) =>
                  getIt<CategoryProductsCubit>()..getProducts(limit: 4),
            ),

            // this cubit for favorite products
            BlocProvider.value(value: getIt<WishlistCubit>()),
            
            BlocProvider(create: (context) => getIt<NavCubit>()),

            BlocProvider(create: (context) => getIt<ProfileCubit>()),
            
          ],
          child: const MainNavScreen(),
        );
      },
    );
  }
}
