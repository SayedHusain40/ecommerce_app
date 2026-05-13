import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  const AppElevatedButtonTheme._();

  static final ElevatedButtonThemeData light = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        // disabledBackgroundColor: AppColors.grey100,
        // disabledForegroundColor: AppColors.grey0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.button2,
        minimumSize: const Size(double.infinity, 60),
      ),
  );

  static final ElevatedButtonThemeData dark = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cyan,
        foregroundColor: AppColors.white,
        // disabledBackgroundColor: AppColors.grey800,
        // disabledForegroundColor: AppColors.grey400,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.button2,
        minimumSize: const Size(double.infinity, 60),
        // fixedSize:  const Size(double.infinity, 60),
      ),
  );
}
