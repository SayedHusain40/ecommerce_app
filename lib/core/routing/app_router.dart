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
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_detail_screen.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/ui/screen/change_password_new_screen.dart';
import 'package:ecommerce_app/features/profile/ui/screen/faqs_screen.dart';
import 'package:ecommerce_app/features/profile/ui/screen/privacy_policy_screen.dart';
import 'package:ecommerce_app/features/profile/ui/screen/terms_and_conditions_screen.dart';
import 'package:ecommerce_app/features/profile/ui/screen/verify_old_password_screen.dart';
import 'package:ecommerce_app/features/register/logic/register_cubit.dart';
import 'package:ecommerce_app/features/register/ui/screens/register_screen.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.appAuthState:
        final sendEmailOnInit = (settings.arguments as bool?) ?? false;
        return MaterialPageRoute(
          builder: (context) => AppAuthState(sendEmailOnInit: sendEmailOnInit),
        );
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case RouteNames.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case RouteNames.confirmationEmailScreenScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgotPasswordCubit>(),
            child: const ConfirmationEmailScreen(),
          ),
        );

      // we add new cubit here we actually we can reused cubit
      // and then we can get loaded category that in home screen
      case RouteNames.categoryScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CategoryCubit>()..getCategories(),
            child: const CategoryScreen(),
          ),
        );

      case RouteNames.productDetailScreen:
        final productModel = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getIt<WishlistCubit>(),
            child: ProductDetailScreen(productModel: productModel),
          ),
        );
      case RouteNames.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
        );
      case RouteNames.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsScreen(),
        );
      case RouteNames.faqsScreen:
        return MaterialPageRoute(builder: (context) => const FaqsScreen());
      case RouteNames.verifyOldPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const VerifyOldPasswordScreen(),
          ),
        );
      case RouteNames.changePasswordNewScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ChangePasswordNewScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const UndefinedRouteScreen(),
        );
    }
  }
}

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Something went wrong', style: TextStyle(fontSize: 18)),

            SizedBox(height: 16),

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
