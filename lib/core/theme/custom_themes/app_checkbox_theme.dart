// // app_checkbox_theme.dart
// import 'package:flutter/material.dart';
// import 'package:theme/mytheme/app_colors.dart';

// class AppCheckboxTheme {
//   const AppCheckboxTheme._();

//   // light
//   static final CheckboxThemeData light = CheckboxThemeData(
//     fillColor: WidgetStateProperty.resolveWith<Color>((states) {
//       return states.contains(WidgetState.selected)
//           ? AppColors.primary100
//           : AppColors.primary100;
//     }),
//     checkColor: WidgetStateProperty.resolveWith<Color>((states) {
//       return states.contains(WidgetState.selected)
//           ? Colors.white
//           : Colors.black;
//     }),
//   );

//   // dark
//   static final CheckboxThemeData dark = CheckboxThemeData(
//     fillColor: WidgetStateProperty.resolveWith<Color>((states) {
//       return states.contains(WidgetState.selected)
//           ? AppColors.grey600
//           : AppColors.grey400;
//     }),
//     checkColor: WidgetStateProperty.resolveWith<Color>((states) {
//       return states.contains(WidgetState.selected)
//           ? Colors.black
//           : Colors.white;
//     }),
//   );
// }
