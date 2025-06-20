import 'package:flutter/material.dart';

class AppTheme {
  // Color Palette
  static const Color sidebarBackground = Color(0xFF1C2331);
  static const Color sidebarSelected = Color(0xFF3366FF);
  static const Color sidebarText = Colors.white;
  static const Color sidebarTextSecondary = Colors.white54;
  static const Color sidebarTextTertiary = Colors.white60;
  static const Color sidebarDivider = Colors.white24;
  static const Color sidebarIcon = Colors.white;
  static const Color sidebarIconUnselected = Colors.white70;
  static final Color sidebarProfileBackground = Colors.grey.shade700;

  static const Color mainBackground = Color(0xFFF5F7FA);
  static const Color mainCard = Color(0xFFFFFFFF);
  static const Color mainPrimary = Color(0xFF3366FF);
  static const Color mainText = Color(0xFF1C2331);
  static const Color mainTextSecondary = Color(0xFF7B8591);
  static const Color mainDivider = Color(0xFFE5EAF1);

  // ThemeData 예시 (필수는 아님, 필요할 때만)
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: mainBackground,
      primaryColor: mainPrimary,
      fontFamily: 'Pretendard',
      colorScheme: ColorScheme.light(
        primary: mainPrimary,
        background: mainBackground,
        onPrimary: Colors.white,
        onBackground: mainText,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: mainText,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: mainTextSecondary,
        ),
      ),
    );
  }
}
