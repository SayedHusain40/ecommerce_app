import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_fonts.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_bottom_sheet_theme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_color_scheme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_elevated_button_theme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_input_decoration_theme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_text_button_theme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/bar_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  // ---------------- LIGHT THEME ----------------
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppFonts.plusJakartaSans,
    colorScheme: AppColorScheme.light,
  
    // textTheme: AppTextTheme.light,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: BarTheme.light,
    elevatedButtonTheme: AppElevatedButtonTheme.light,
    textButtonTheme: AppTextButtonTheme.light,
    inputDecorationTheme: AppInputDecorationTheme.light,

    bottomSheetTheme: AppBottomSheetTheme.light,
    // checkboxTheme: AppCheckboxTheme.light,
  );

  // ---------------- DARK THEME ----------------
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppFonts.plusJakartaSans,
    colorScheme: AppColorScheme.dark,

    // textTheme: AppTextTheme.dark,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: BarTheme.dark,
    elevatedButtonTheme: AppElevatedButtonTheme.dark,
    textButtonTheme: AppTextButtonTheme.dark,
    inputDecorationTheme: AppInputDecorationTheme.dark,
    
    bottomSheetTheme: AppBottomSheetTheme.dark,
    // checkboxTheme: AppCheckboxTheme.dark,
  );
}


/*
    visualDensity: VisualDensity.adaptivePlatformDensity,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
*/

