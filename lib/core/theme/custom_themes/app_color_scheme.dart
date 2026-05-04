import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  const AppColorScheme._();

  static final ColorScheme light = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.cyan,
  );

  static final ColorScheme dark = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppColors.cyan,
  );
}