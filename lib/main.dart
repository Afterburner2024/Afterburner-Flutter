import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/main_page.dart';
import 'screens/study_page.dart';
import 'screens/sideproject_page.dart';
import 'screens/qna_page.dart';
import 'screens/login_page.dart';
import 'screens/my_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afterburner',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/study': (context) => const StudyPage(),
        '/sideproject': (context) => const SideProjectPage(),
        '/qna': (context) => const QnAPage(),
        '/login': (context) => const LoginPage(),
        '/mypage': (context) => const MyPage(),
      },
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.black,
        fontFamily: 'NotoSans',
        appBarTheme: const AppBarTheme(
          // backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}
