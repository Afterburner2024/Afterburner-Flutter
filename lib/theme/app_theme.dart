import 'package:flutter/material.dart';

class AppTheme {
  // Sidebar Color Palette
  static const Color sidebarBackground = Color(0xFF1C2331);
  static const Color sidebarSelected = Color(0xFF3366FF);
  static const Color sidebarText = Colors.white;
  static const Color sidebarTextSecondary = Colors.white54;
  static const Color sidebarTextTertiary = Colors.white60;
  static const Color sidebarDivider = Colors.white24;
  static const Color sidebarIcon = Colors.white;
  static const Color sidebarIconUnselected = Colors.white70;
  static final Color sidebarProfileBackground = Colors.grey;

  // Main Color Palette
  static const Color mainBackground = Color(0xFFFFFFFF);         // 바탕색
  static const Color mainCard = Color(0xFFFFFFFF);               // 카드 배경
  static const Color mainPrimary = Color(0xFF3C63EA);            // 주요 강조(앱의 대표 컬러, 버튼 등)
  static const Color mainText = Color(0xFF2D2A2A);               // 메인 텍스트
  static const Color mainTextPrimary = Color(0xFF0D0D0D);        // 제목, 헤더
  static const Color mainTextSecondary = Color(0xFF595959);      // 서브텍스트, 설명, 플레이스홀더
  static const Color mainDivider = Color(0xFFE5EAF1);

  // 버튼
  static const Color buttonPositive = Color(0xFF3C63EA);         // 긍정 버튼(메인)
  static const Color buttonNegative = Color(0xFFEA3C63);         // 부정/위험 버튼

  static LinearGradient get mainFlameGradient => const LinearGradient(
    colors: [Color(0xFF3C63EA), Color(0xFF3366FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // ThemeData 예시
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
        error: buttonNegative,
        secondary: sidebarSelected,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: mainTextPrimary,      // 제목(가장 강조)
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: mainText,             // 일반 제목/텍스트
        ),
        bodyMedium: TextStyle(
          color: mainTextSecondary,    // 설명/서브텍스트
        ),
        bodySmall: TextStyle(
          color: mainTextSecondary,
        ),
      ),
      dividerColor: mainDivider,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(buttonPositive),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(mainPrimary),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(mainPrimary),
          side: MaterialStatePropertyAll(
            BorderSide(color: mainPrimary),
          ),
        ),
      ),
      // 필요에 따라 negative 버튼 등은 개별적으로 스타일 적용
    );
  }
}
