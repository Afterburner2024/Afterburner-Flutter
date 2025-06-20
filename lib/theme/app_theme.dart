import 'package:flutter/material.dart';

// ------ 컬러 팔레트 상수 ------
const Color kBackground    = Color(0xFFFAEEE7); // 크림톤 배경
const Color kCard          = Color(0xFFFFFFFF); // 화이트 카드
const Color kPrimary       = Color(0xFF55423D); // 딥 브라운
const Color kSecondary     = Color(0xFFFFC6AC); // 포인트 살구
const Color kAccent        = Color(0xFF3B82F6); // 포인트 블루
const Color kGray          = Color(0xFFDED6D1); // 소프트 그레이
const Color kTextMain      = Color(0xFF55423D); // 메인 텍스트
const Color kTextSub       = Color(0xFF9A8572); // 서브 텍스트
const Color kDivider       = Color(0xFFDED6D1);

// ------ ThemeData 정의 ------
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: kBackground,
  primaryColor: kPrimary,
  cardColor: kCard,
  dividerColor: kDivider,
  appBarTheme: const AppBarTheme(
    backgroundColor: kBackground,
    elevation: 1.5,
    iconTheme: IconThemeData(color: kPrimary),
    titleTextStyle: TextStyle(
      color: kPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: kTextMain, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: kTextSub),
    bodyMedium: TextStyle(color: kTextMain),
  ),
  cardTheme: CardTheme(
    color: kCard,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kSecondary,
      foregroundColor: kPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: kCard,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: kGray),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: kAccent, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  ),
);
