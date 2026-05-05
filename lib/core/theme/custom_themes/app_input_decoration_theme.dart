import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppInputDecorationTheme {
  const AppInputDecorationTheme._();

  static final InputDecorationTheme light = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.grey50Light),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.cyan),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.red),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.grey100Light,
      ), // lighter than enabled
    ),
    fillColor: AppColors.white,
    filled: true,
    hintStyle: AppTextStyles.body3Regular.copyWith(
      color: AppColors.grey100Light,
    ),
  );

  static final InputDecorationTheme dark = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.grey150Dark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.cyan),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.red),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.grey100Light,
      ), // lighter than enabled
    ),
    fillColor: AppColors.black,
    filled: true,
    hintStyle: AppTextStyles.body4Regular.copyWith(
      color: AppColors.grey100Light,
    ),
  );
}
