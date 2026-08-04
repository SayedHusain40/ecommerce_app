// lib/features/onboarding/data/onboarding_data.dart

import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_model.dart';

import 'package:ecommerce_app/l10n/app_localizations.dart';

class OnboardingData {
  const OnboardingData._();

  static List<OnboardingModel> pages(AppLocalizations l10n) => [
    OnboardingModel(
      image: AppImages.onboarding1,
      title: l10n.onboarding1Title,
      description: l10n.onboarding1Description,
    ),
    OnboardingModel(
      image: AppImages.onboarding2,
      title: l10n.onboarding2Title,
      description: l10n.onboarding2Description,
    ),
    OnboardingModel(
      image: AppImages.onboarding3,
      title: l10n.onboarding3Title,
      description: l10n.onboarding3Description,
    ),
  ];
}
