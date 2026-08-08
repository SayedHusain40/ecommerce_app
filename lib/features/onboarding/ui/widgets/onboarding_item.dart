import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.page,
    required this.index,
    required this.pagesLength,
    required this.pageController,
  });

  final OnboardingModel page;
  final int index;
  final int pagesLength;
  final PageController pageController;

  bool get _isFirstPage => index == 0;
  bool get _isLastPage => index == pagesLength - 1;

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = getIt<SharedPreferencesService>();
    final brightness = context.brightness;
    final isDark = context.isRtl;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ---------------- IMAGE CONTAINER ----------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              height: 408,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cyan50(brightness),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  // ---------------- TOP ROW ----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _isFirstPage
                          ? SvgPicture.asset(AppImages.logo(brightness))
                          : IconButton(
                              onPressed: () {
                                pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              },
                              icon: SvgPicture.asset(
                                AppIcons.arrowLeft(brightness),
                              ),
                            ),
                      if (!_isLastPage)
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: const Size(0, 0),
                            backgroundColor: Colors.transparent,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide.none,
                            ),
                          ),
                          onPressed: () async {
                            await sharedPreferences.saveData(
                              key: 'isFirstTime',
                              value: false,
                            );
                            if (!context.mounted) return;
                            context.pushNamedAndRemoveUntil(
                              RouteNames.registerScreen,
                              predicate: (route) => false,
                            );
                          },
                          child: Text(
                            l10n.skipForNow,
                            style: AppTextStyles.body2Medium.copyWith(
                              color: AppColors.cyan,
                            ),
                          ),
                        ),
                    ],
                  ),
                  // ---------------- IMAGE ----------------
                  Expanded(
                    child: Center(
                      child: Image.asset(page.image, width: 240, height: 240),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ---------------- TITLE ----------------
            Text(
              page.title,
              style: AppTextStyles.headingH2Bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // ---------------- DESCRIPTION ----------------
            Text(
              page.description,
              style: AppTextStyles.body2Regular,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // ---------------- BUTTONS ----------------
            _isLastPage
                ? Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: isDark
                                ? AppColors.cyan
                                : AppColors.black,
                          ),
                          onPressed: () async {
                            await sharedPreferences.saveData(
                              key: StorageKeys.isFirstTime,
                              value: false,
                            );
                            if (!context.mounted) return;

                            context.pushNamedAndRemoveUntil(
                              RouteNames.loginScreen,
                              predicate: (route) => false,
                            );
                          },
                          child: Text(l10n.login),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await sharedPreferences.saveData(
                              key: 'isFirstTime',
                              value: false,
                            );
                            if (!context.mounted) return;
                            context.pushNamedAndRemoveUntil(
                              RouteNames.registerScreen,
                              predicate: (route) => false,
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(l10n.getStarted),
                              const SizedBox(width: 8),
                              SvgPicture.asset(AppIcons.arrowRightLight),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(l10n.next),
                  ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
