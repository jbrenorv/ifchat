import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const int _ifGrennPrimaryValue = 0xFF65B526;

  static const Color ifDarkGrenn = Color(0xFF006534);
  static const Color ifGrenn = Color(_ifGrennPrimaryValue);
  static const Color ifRed = Color(0xFFEB5757);
  static const Color ifGray = Color(0xFF828282);
  static const Color ifWhite = Color(0xFFFFFFFF);
  static const Color ifWhiteSubtitle = Color(0xFFF2F2F2);

  static const MaterialColor ifMaterialGreenColor = MaterialColor(
    _ifGrennPrimaryValue,
    <int, Color>{
      50: Color(0xFFeff8e7),
      100: Color(0xFFd7eec3),
      200: Color(0xFFbce29c),
      300: Color(0xFFa0d773),
      400: Color(0xFF89ce51),
      500: Color(0xFF73c52e),
      600: Color(_ifGrennPrimaryValue),
      700: Color(0xFF4ea11b),
      800: Color(0xFF388d10),
      900: Color(0xFF006b00),
    },
  );

  static const LinearGradient ifLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[ifDarkGrenn, ifGrenn],
  );
}
