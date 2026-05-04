import 'package:ecommerce_app/core/constants/app_images.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_data.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_model.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageControllers = PageController();
  final _pages = OnboardingData.pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageControllers,
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            return OnboardingItem(
              page: _pages[index],
              index: index,
              pagesLength: _pages.length,
              pageController: _pageControllers,
            );
          },
        ),
      ),
    );
  }
}
