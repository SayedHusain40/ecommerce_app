import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_data.dart';
import 'package:ecommerce_app/features/onboarding/ui/widgets/onboarding_item.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pages = OnboardingData.pages(l10n);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ---------------- PAGES ----------------
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,

                itemBuilder: (context, index) {
                  return OnboardingItem(
                    page: pages[index],
                    index: index,
                    pagesLength: pages.length,
                    pageController: _pageController,
                  );
                },
              ),
            ),

            // ---------------- INDICATOR ----------------
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: const SlideEffect(
                  spacing: 4.0,
                  dotWidth: 6.0,
                  dotHeight: 6.0,
                  dotColor: AppColors.grey100,
                  activeDotColor: AppColors.green,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}