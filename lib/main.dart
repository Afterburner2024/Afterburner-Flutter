import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afterburner',
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'NotoSans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}
