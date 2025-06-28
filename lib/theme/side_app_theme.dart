import 'package:flutter/material.dart';

class AppTheme {
  static const Color mainBackground = Color(0xFFEAF1FB);
  static const Color mainCard = Color(0xFFFFFFFF);
  static const Color mainPrimary = Color(0xFF3568FF);
  static const Color mainAccent = Color(0xFFF7B267);
  static const Color mainLavender = Color(0xFFE8EAF6);
  static const Color mainDivider = Color(0xFFE5EAF0);
  static const Color mainShadow = Color(0x113568FF);
  static const Color mainDanger = Color(0xFFFF5C6C);
  static const Color mainSuccess = Color(0xFF3CC57B);

  static const Color mainTextPrimary = Color(0xFF1D2533);
  static const Color mainTextSecondary = Color(0xFF656D7A);
  static const Color mainTextHint = Color(0xFFA2AAB8);

  static const Color buttonPositive = mainPrimary;
  static const Color buttonNegative = mainDanger;

  static const LinearGradient mainFlameGradient = LinearGradient(
    colors: [mainPrimary, mainAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
