import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppNavigationBarTheme {
  const AppNavigationBarTheme._();

  static const NavigationBarThemeData light = NavigationBarThemeData(
    backgroundColor: AppColors.white,
  );

  static const NavigationBarThemeData dark = NavigationBarThemeData(
    backgroundColor: AppColors.black,
  );
}