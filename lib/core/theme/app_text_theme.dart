import 'package:flutter/material.dart';

import 'app_pallete.dart';

TextStyle poppinsTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontFamily: 'Poppins',
    color: color ?? AppPallete.secondaryColor,
  );
}

final TextTheme appTextTheme = TextTheme(
  displayLarge: poppinsTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: poppinsTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: poppinsTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: poppinsTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: poppinsTextStyle(
    fontSize: 16,
  ),
  bodyMedium: poppinsTextStyle(
    fontSize: 14,
  ),
  bodySmall: poppinsTextStyle(
    fontSize: 12,
  ),
  labelLarge: poppinsTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  labelMedium: poppinsTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: poppinsTextStyle(
    fontSize: 12,
  ),
  headlineLarge: poppinsTextStyle(
    fontWeight: FontWeight.w500,
  ),
);
