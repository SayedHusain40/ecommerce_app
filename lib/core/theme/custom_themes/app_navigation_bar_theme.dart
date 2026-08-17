import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppNavigationBarTheme {
  const AppNavigationBarTheme._();

  static final NavigationBarThemeData light = NavigationBarThemeData(
    backgroundColor: AppColors.white,
    labelTextStyle: WidgetStateProperty.resolveWith(
      (states) => _labelStyle(states, AppColors.grey150Light),
    ),
  );

  static final NavigationBarThemeData dark = NavigationBarThemeData(
    backgroundColor: AppColors.black,
    labelTextStyle: WidgetStateProperty.resolveWith(
      (states) => _labelStyle(states, AppColors.grey150Dark),
    ),
  );

  static TextStyle _labelStyle(Set<WidgetState> states, Color unselectedColor) {
    final isSelected = states.contains(WidgetState.selected);

    return isSelected
        ? AppTextStyles.body3SemiBold.copyWith(
            overflow: TextOverflow.ellipsis,
          )
        : AppTextStyles.body3Regular.copyWith(
            color: unselectedColor,
            overflow: TextOverflow.ellipsis,
          );
  }
}