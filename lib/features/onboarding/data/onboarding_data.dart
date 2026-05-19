// lib/features/onboarding/data/onboarding_data.dart

import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_model.dart';

class OnboardingData {
  const OnboardingData._();

  static final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AppImages.onboarding1,
      title: 'Explore a wide range of products',
      description:
          'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
    ),
    OnboardingModel(
      image: AppImages.onboarding2,
      title: 'Unlock exclusive offers and discounts',
      description:
          'Get access to limited-time deals and special promotions available only to our valued customers.',
    ),
    OnboardingModel(
      image: AppImages.onboarding3,
      title: 'Safe and secure payments',
      description:
          'QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
    ),
  ];
}
