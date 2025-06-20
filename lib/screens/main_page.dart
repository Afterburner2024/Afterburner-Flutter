import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 1.5,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Image.asset(
                'assets/logo.png',
                height: 36,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: kCard,
                backgroundColor: kSecondary,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: kSecondary.withOpacity(0.1)),
                ),
                elevation: 0,
              ),
              child: Text(
                '로그인',
                style: TextStyle(
                  color: kPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Hero 영역
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 340,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(36)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kBackground.withOpacity(0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '성장하는 개발자들의\n스터디 & 프로젝트 플랫폼',
                    style: TextStyle(
                      color: kPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      shadows: [
                        Shadow(color: Colors.white70, blurRadius: 8),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '지금 바로 다양한 팀원들과 함께 시작하세요!',
                    style: TextStyle(
                      color: kTextSub,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
