import 'package:ecommerce_app/core/theme/constants/app_font_weights.dart';
import 'package:ecommerce_app/core/theme/constants/app_fonts.dart';
import 'package:ecommerce_app/core/theme/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const _base = TextStyle(fontFamily: AppFonts.plusJakartaSans);

  // ---------------- HEADING 1 (32px · height 120% · spacing 0%) ----------------

  static final headingH1Bold = _base.copyWith(
    fontWeight: AppFontWeights.bold,
    fontSize: AppSizes.fontSizeL,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static final headingH1SemiBold = _base.copyWith(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeL,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static final headingH1Regular = _base.copyWith(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeL,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  // ---------------- HEADING 2 (24px · height 120% · spacing 0%) ----------------

  static final headingH2Bold = _base.copyWith(
    fontWeight: AppFontWeights.bold,
    fontSize: AppSizes.fontSizeM,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static final headingH2SemiBold = _base.copyWith(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeM,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  static final headingH2Regular = _base.copyWith(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeM,
    height: AppSizes.fontHeightM,
    letterSpacing: 0,
  );

  // ---------------- HEADING 3 (18px · height 120% · spacing 0.25%) ----------------

  static final headingH3Bold = _base.copyWith(
    fontWeight: AppFontWeights.bold,
    fontSize: AppSizes.fontSizeXS,
    height: AppSizes.fontHeightM,
    letterSpacing: 0.045,
  );

  static final headingH3SemiBold = _base.copyWith(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeXS,
    height: AppSizes.fontHeightM,
    letterSpacing: 0.045,
  );

  static final headingH3Regular = _base.copyWith(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeXS,
    height: AppSizes.fontHeightM,
    letterSpacing: 0.045,
  );

  // ---------------- BUTTON 1 (16px · Semi-Bold · Auto · 0%) ----------------

  static final button1 = _base.copyWith(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeXXS,
    letterSpacing: 0,
  );

  // ---------------- BUTTON 2 (14px · Semi-Bold · Auto · 0%) ----------------

  static final button2 = _base.copyWith(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeTiny,
    letterSpacing: 0,
  );

  // ---------------- BODY 1 (16px · height 150% · spacing 0.5%) ----------------

  static final body1Medium = _base.copyWith(
    fontWeight: AppFontWeights.medium,
    fontSize: AppSizes.fontSizeXXS,
    height: 1.5,
    letterSpacing: 0.08,
  );

  static final body1Regular = _base.copyWith(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeXXS,
    height: 1.5,
    letterSpacing: 0.08,
  );

  // ---------------- BODY 2 (14px · height 150% · spacing 0.5%) ----------------

  static final body2Medium = _base.copyWith(
    fontWeight: AppFontWeights.medium,
    fontSize: AppSizes.fontSizeTiny,
    height: 1.5,
    letterSpacing: 0.07,
  );

  static final body2Regular = _base.copyWith(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeTiny,
    height: 1.5,
    letterSpacing: 0.07,
  );

  // ---------------- BODY 3 (12px · Auto · spacing 0.5%) ----------------

  static final body3SemiBold = _base.copyWith(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeMicro,
    letterSpacing: 0.06,
  );

  static final body3Regular = _base.copyWith(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeMicro,
    letterSpacing: 0.06,
  );

  // ---------------- BODY 4 (10px · Auto · spacing 1.5%) ----------------

  static final body4SemiBold = _base.copyWith(
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppSizes.fontSizeNano,
    letterSpacing: 0.15,
  );

  static final body4Regular = _base.copyWith(
    fontWeight: AppFontWeights.regular,
    fontSize: AppSizes.fontSizeNano,
    letterSpacing: 0.15,
  );
}
