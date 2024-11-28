import 'package:flutter/material.dart';
import 'screen/mainpage.dart';
import 'screen/question_board.dart';
import 'screen/free_board.dart';
import 'screen/login.dart';
import 'screen/my_page.dart';
import 'widget/custom_app_bar.dart'; // CustomAppBar 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug 배너 제거
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 라우트
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(page: MainPage()),
        '/questionBoard': (context) => MainLayout(page: QuestionBoardScreen()),
        '/freeBoard': (context) => MainLayout(page: FreeBoardScreen()),
        '/login': (context) => MainLayout(page: LoginScreen()),
        '/myPage': (context) => MainLayout(page: MyPageScreen()),
      },
    );
  }
}

// 공통 레이아웃 위젯 (CustomAppBar 포함)
class MainLayout extends StatelessWidget {
  final Widget page; // 페이지를 동적으로 렌더링

  const MainLayout({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), // 모든 화면에 공통 앱바 추가
      body: page, // 전달받은 페이지를 렌더링
    );
  }
}
