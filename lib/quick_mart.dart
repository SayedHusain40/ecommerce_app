import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class QuickMart extends StatelessWidget {
  final AppRouter appRouter;
  const QuickMart({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      home: Scaffold(body: OnboardingScreen()),
    );
  }
}
