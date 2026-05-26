import 'package:ecommerce_app/core/auth/app_auth_state.dart';
import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/categories/ui/screens/category_screen.dart';
import 'package:ecommerce_app/features/forgot_password/logic/forgot_password_cubit.dart';
import 'package:ecommerce_app/features/forgot_password/ui/screens/confirmation_email_screen.dart';
import 'package:ecommerce_app/features/login/logic/login_cubit.dart';
import 'package:ecommerce_app/features/login/ui/login_screen.dart';
import 'package:ecommerce_app/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:ecommerce_app/features/register/logic/register_cubit.dart';
import 'package:ecommerce_app/features/register/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.appAuthState:
        final sendEmailOnInit = (settings.arguments as bool?) ?? false;
        return MaterialPageRoute(
          builder: (context) =>
              AppAuthState(sendEmailOnInit: sendEmailOnInit), // ← clean
        );
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      // case RouteNames.homeScreen:
      //   return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case RouteNames.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: RegisterScreen(),
          ),
        );
      case RouteNames.confirmationEmailScreenScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgotPasswordCubit>(),
            child: ConfirmationEmailScreen(),
          ),
        );
      case RouteNames.categoryScreen:
        // return MaterialPageRoute(builder: (context) => CategoryScreen()); // not works
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: context
                .read<CategoryCubit>(), // reuse the already-loaded cubit
            child: CategoryScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => UndefinedRouteScreen());
    }
  }
}

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Something went wrong', style: TextStyle(fontSize: 18)),

            const SizedBox(height: 16),

            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamedAndRemoveUntil(
            //       context,
            //       RouteNames.homeScreen,
            //       (route) => false,
            //     );
            //   },
            //   child: const Text('Go Home'),
            // ),
          ],
        ),
      ),
    );
  }
}
