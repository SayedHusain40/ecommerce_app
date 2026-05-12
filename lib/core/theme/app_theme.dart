import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_fonts.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_color_scheme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_elevated_button_theme.dart';
import 'package:ecommerce_app/core/theme/custom_themes/app_input_decoration_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    inputDecorationTheme: AppInputDecorationTheme.light,

    // checkboxTheme: AppCheckboxTheme.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light, // iOS only
      ),
    ),
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
    inputDecorationTheme: AppInputDecorationTheme.dark,

    // checkboxTheme: AppCheckboxTheme.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark, // iOS only
      ),
    ),
  );
}


/*
    visualDensity: VisualDensity.adaptivePlatformDensity,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
*/

