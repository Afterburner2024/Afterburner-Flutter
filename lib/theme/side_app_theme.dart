import 'package:flutter/material.dart';

class AppTheme {
  static const Color mainBackground = Color(0xFFFFE5D4); // 밝은 오렌지 배경
  static const Color mainCard      = Color(0xFFFFFFFF);  // 카드: 흰색(유지)
  static const Color mainPrimary   = Color(0xFFFB542F);  // 메인 컬러 (FB542F)
  static const Color mainAccent    = Color(0xFFFD9F3B);  // 서브 컬러 (FD9F3B)
  static const Color mainLavender  = Color(0xFFFFF3E4);  // 라이트 오렌지톤(기존 Lavendar 자리에 밝은 오렌지)
  static const Color mainDivider   = Color(0xFFFFD6B0);  // 오렌지 계열 연한 선

  static const Color mainShadow    = Color(0x26FB542F);  // 메인 오렌지 그림자(15%)
  static const Color mainDanger    = Color(0xFFFB542F);  // Danger도 메인 컬러 활용(동일)
  static const Color mainSuccess   = Color(0xFF3CC57B);  // 초록(성공) 그대로

  static const Color mainTextPrimary   = Color(0xFF263159); // 진한 네이비 (가독성 up)
  static const Color mainTextSecondary = Color(0xFF787A91); // 연한 네이비
  static const Color mainTextHint      = Color(0xFFB6B6B6); // 기존 그대로

  static const Color buttonPositive = mainPrimary;
  static const Color buttonNegative = mainDanger;

  static const LinearGradient mainFlameGradient = LinearGradient(
    colors: [mainPrimary, mainAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
