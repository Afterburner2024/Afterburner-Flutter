import 'package:flutter/material.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF181A20),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF181A20),
    foregroundColor: Color(0xFFF1F5F9),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Color(0xFFF1F5F9),
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF3B82F6),
    secondary: Color(0xFF23252D),
    background: Color(0xFF181A20),
    surface: Color(0xFF23252D),
    onPrimary: Colors.white,
    onBackground: Color(0xFFF1F5F9),
  ),
  fontFamily: 'NotoSans',
);
