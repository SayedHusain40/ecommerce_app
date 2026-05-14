import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextButtonTheme {
  const AppTextButtonTheme._();

  static final TextButtonThemeData light = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.black,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 1, color: AppColors.grey50Light),
      ),
      textStyle: AppTextStyles.button2,
      minimumSize: const Size(double.infinity, 60),
    ),
  );

  static final TextButtonThemeData dark = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.white,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 1, color: AppColors.grey50Dark),
      ),
      textStyle: AppTextStyles.button2,
      minimumSize: const Size(double.infinity, 60),
    ),
  );
}
