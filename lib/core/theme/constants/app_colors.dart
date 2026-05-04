import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // ---------------- BRAND COLORS ----------------

  static const Color cyan       = Color(0xFF21D4B4);
  static const Color black      = Color(0xFF1C1B1B);
  static const Color white      = Color(0xFFFFFFFF);

  // ---------------- CYAN 50 ----------------

  static const Color cyan50Light = Color(0xFFF4FDFA);
  static const Color cyan50Dark  = Color(0xFF212322);

  // ---------------- GREY LIGHT ----------------

  static const Color grey50Light  = Color(0xFFF4F5FD);
  static const Color grey100Light = Color(0xFFC0C0C0);
  static const Color grey150Light = Color(0xFF6F7384);

  // ---------------- GREY DARK ----------------

  static const Color grey50Dark   = Color(0xFF282828);
  static const Color grey100Dark  = Color(0xFFC0C0C0);
  static const Color grey150Dark  = Color(0xFFA2A2A6);

  // ---------------- GENERAL (same in both modes) ----------------

  static const Color red      = Color(0xFFEE4D4D);
  static const Color blue     = Color(0xFF1F88DA);
  static const Color purple   = Color(0xFF4F1FDA);
  static const Color yellow   = Color(0xFFEBEF14);
  static const Color orange   = Color(0xFFF0821D);
  static const Color merigold = Color(0xFFFFCB45);
  static const Color brown    = Color(0xFF5A1A05);
  static const Color pink     = Color(0xFFCE1DEB);
  static const Color green    = Color(0xFF08E488);

  // ---------------- THEME-AWARE HELPERS ----------------

  static Color cyan50(Brightness b)  => b == Brightness.dark ? cyan50Dark  : cyan50Light;
  static Color grey50(Brightness b)  => b == Brightness.dark ? grey50Dark  : grey50Light;
  static Color grey100(Brightness b) => b == Brightness.dark ? grey100Dark : grey100Light;
  static Color grey150(Brightness b) => b == Brightness.dark ? grey150Dark : grey150Light;
}