import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarTheme {
  const BarTheme._();

  static const AppBarTheme light = AppBarTheme(
    backgroundColor: AppColors.white,
    
    // elevation: 1,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark, // iOS only
    ),
  );
  static const AppBarTheme dark = AppBarTheme(
    backgroundColor: AppColors.black,
    // elevation: 1,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light, // iOS only
    ),
  );
}
