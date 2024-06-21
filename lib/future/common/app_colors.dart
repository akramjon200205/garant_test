import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static Color red = Colors.red;
  static Color black = const Color(0xff000000);
  static Color white = const Color(0xffffffff);
  static Color green = const Color(0xff27AE60);
  static Color blue = const Color(0xff006FE5);
  static Color lightWhite = const Color(0xffF1F3F7);
  static Color textColor = const Color(0xff242424);
  static Color orange = const Color(0xffFFA500);
}

// class BaseColor extends ColorSwatch<int> {
//   const BaseColor(super.primary, super.swatch);

//   Color get shade100 => this[100]!;

//   Color get shade50 => this[50]!;

//   Color get shade40 => this[40]!;

//   Color get shade80 => this[80]!;

//   Color get shade20 => this[20]!;

//   Color get shade60 => this[60]!;
// }

// class PrimaryColor extends ColorSwatch<int> {
//   const PrimaryColor(super.primary, super.swatch);

//   Color get shade100 => this[100]!;

//   Color get shade50 => this[50]!;
// }

// class MetalColor extends ColorSwatch<int> {
//   MetalColor()
//       : super(
//           0xff111827,
//           <int, Color>{
//             // 200: const Color(0xffE5E7EB),
//             100: const Color(0xff111827),
//             90: const Color(0xff111827),
//             70: const Color(0xff111827).withOpacity(.7),
//             50: const Color(0xff6B7280),
//             40: const Color(0xff9CA3B0),
//             30: const Color(0xffD1D5DB),
//             10: const Color(0xffF3F4F6),
//           },
//         );

//   Color get shade100 => this[100]!;
//   Color get shade90 => this[90]!;
//   Color get shade70 => this[70]!;
//   Color get shade50 => this[50]!;
//   Color get shade40 => this[40]!;
//   Color get shade30 => this[30]!;
//   Color get shade10 => this[10]!;
// }
