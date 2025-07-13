import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경 흰색
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 위쪽 로고 이미지
            Image.asset(
              'assets/Afterberner.png',
              width: 120,
              fit: BoxFit.contain,
            ),
            // 아래쪽 텍스트 이미지
            Image.asset(
              'assets/splash_text.png',
              width: 180,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
