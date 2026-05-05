import 'package:ecommerce_app/core/theme/constants/app_font_weights.dart';
import 'package:ecommerce_app/core/theme/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  // ---------------- HEADING 1 (32px · height 120% · spacing 0%) ----------------

  static const headingH1Bold = TextStyle(
    fontWeight: AppFontWeights.bold,
    fontSize: AppSizes.fontSizeL,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static const headingH1SemiBold = TextStyle(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeL,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static const headingH1Regular = TextStyle(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeL,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  // ---------------- HEADING 2 (24px · height 120% · spacing 0%) ----------------

  static const headingH2Bold = TextStyle(
    fontWeight: AppFontWeights.bold,
    fontSize: AppSizes.fontSizeM,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static const headingH2SemiBold = TextStyle(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeM,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static const headingH2Regular = TextStyle(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeM,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  // ---------------- HEADING 3 (18px · height 120% · spacing 0.25%) ----------------
  // letterSpacing: 0.25% of 18px = 0.045

  static const headingH3Bold = TextStyle(
    fontWeight: AppFontWeights.bold,
    fontSize: AppSizes.fontSizeXS,
    height: AppSizes.fontHeightM,
    letterSpacing: 0.045,
  );

  static const headingH3SemiBold = TextStyle(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeXS,
    height: AppSizes.fontHeightM,
    letterSpacing: 0.045,
  );

  static const headingH3Regular = TextStyle(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeXS,
    height: AppSizes.fontHeightM,
    letterSpacing: 0.045,
  );

  // ---------------- BUTTON 1 (16px · Semi-Bold · Auto · 0%) ----------------

  static const button1 = TextStyle(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeXXS,
    letterSpacing: 0,
  );

  // ---------------- BUTTON 2 (14px · Semi-Bold · Auto · 0%) ----------------

  static const button2 = TextStyle(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeTiny,
    letterSpacing: 0,
  );

  // ---------------- BODY 1 (16px · height 150% · spacing 0.5%) ----------------
  // letterSpacing: 0.5% of 16px = 0.08

  static const body1Medium = TextStyle(
    fontWeight: AppFontWeights.medium,
    fontSize: AppSizes.fontSizeXXS,
    height: 1.5,
    letterSpacing: 0.08,
  );

  static const body1Regular = TextStyle(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeXXS,
    height: 1.5,
    letterSpacing: 0.08,
  );

  // ---------------- BODY 2 (14px · height 150% · spacing 0.5%) ----------------
  // letterSpacing: 0.5% of 14px = 0.07

  static const body2Medium = TextStyle(
    fontWeight: AppFontWeights.medium,
    fontSize: AppSizes.fontSizeTiny,
    height: 1.5,
    letterSpacing: 0.07,
  );

  static const body2Regular = TextStyle(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeTiny,
    height: 1.5,
    letterSpacing: 0.07,
  );

  // ---------------- BODY 3 (12px · Auto · spacing 0.5%) ----------------
  // letterSpacing: 0.5% of 12px = 0.06

  static const body3SemiBold = TextStyle(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeMicro,
    letterSpacing: 0.06,
  );

  static const body3Regular = TextStyle(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeMicro,
    letterSpacing: 0.06,
  );

  // ---------------- BODY 4 (10px · Auto · spacing 1.5%) ----------------
  // letterSpacing: 1.5% of 10px = 0.15

  static const body4SemiBold = TextStyle(
    fontWeight: AppFontWeights.semiBold,
    fontSize: 10.0,
    letterSpacing: 0.15,
  );

  static const body4Regular = TextStyle(
    fontWeight: AppFontWeights.regular,
    fontSize: 10.0,
    letterSpacing: 0.15,
  );
}