import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color ifDarkGrenn = Color(0xFF006534);
  static const Color ifGrenn = Color(0xFF429D4D);
  static const Color ifLightGrenn = Color(0xFFB5FF00);
  static const Color ifRed = Color(0xFFEB5757);
  static const Color ifGray = Color(0xFF828282);

  static const LinearGradient ifLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[ifDarkGrenn, ifGrenn, ifLightGrenn],
  );
}
