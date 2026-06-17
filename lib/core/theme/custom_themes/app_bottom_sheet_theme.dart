import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomSheetTheme {
  const AppBottomSheetTheme._();

  static const BottomSheetThemeData light = BottomSheetThemeData(
    showDragHandle: true,

    constraints: BoxConstraints.expand(),
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    dragHandleSize: Size(100, 6),
  );

  static const BottomSheetThemeData dark = BottomSheetThemeData(
    showDragHandle: true,
    constraints: BoxConstraints.expand(),

    backgroundColor: AppColors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    dragHandleSize: Size(100, 6),
  );
}
