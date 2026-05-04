import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_fonts.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_color_scheme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_elevated_button_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // ---------------- LIGHT THEME ----------------
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppFonts.plusJakartaSans,
    colorScheme: AppColorScheme.light,

    // textTheme: AppTextTheme.light,
    scaffoldBackgroundColor: AppColors.white,
    // appBarTheme: BarTheme.light,
    elevatedButtonTheme: AppElevatedButtonTheme.light,
    // bottomSheetTheme: AppBottomSheetTheme.light,
    // inputDecorationTheme: AppInputDecorationTheme.light,
    // checkboxTheme: AppCheckboxTheme.light,
  );

  // ---------------- DARK THEME ----------------
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppFonts.plusJakartaSans,
    colorScheme: AppColorScheme.dark,

    // textTheme: AppTextTheme.dark,
    scaffoldBackgroundColor: AppColors.black,
    // appBarTheme: BarTheme.dark,
    elevatedButtonTheme: AppElevatedButtonTheme.dark,
    // bottomSheetTheme: AppBottomSheetTheme.dark,
    // inputDecorationTheme: AppInputDecorationTheme.dark,
    // checkboxTheme: AppCheckboxTheme.dark,
  );
}


/*
    visualDensity: VisualDensity.adaptivePlatformDensity,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
*/

