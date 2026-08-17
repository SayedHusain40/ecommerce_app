import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppNavigationRailTheme {
  const AppNavigationRailTheme._();

  static final NavigationRailThemeData light = NavigationRailThemeData(
    selectedLabelTextStyle: AppTextStyles.body3SemiBold.copyWith(
      overflow: TextOverflow.ellipsis,
      color: AppColors.black,
    ),
    unselectedLabelTextStyle: AppTextStyles.body3Regular.copyWith(
      color: AppColors.grey150Light,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static final NavigationRailThemeData dark = NavigationRailThemeData(
    selectedLabelTextStyle: AppTextStyles.body3SemiBold.copyWith(
      overflow: TextOverflow.ellipsis,
      color: AppColors.white,
    ),
    unselectedLabelTextStyle: AppTextStyles.body3Regular.copyWith(
      color: AppColors.grey150Dark,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
