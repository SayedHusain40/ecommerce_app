import 'package:flutter/material.dart';

class AppFontWeights {
  const AppFontWeights._();

  /// These map Flutter FontWeight values to Figma names.
  /// Useful when matching Figma typography with Flutter.

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular =
      FontWeight.w400; // Normal / regular / plain.
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900; // Figma: Black / Heavy
}
