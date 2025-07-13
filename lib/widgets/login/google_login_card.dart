import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart'; // ← 상대/절대경로로 import 경로 맞춰주세요!

class GoogleLoginCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;

  const GoogleLoginCard({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: isLoading ? null : onTap,
        child: Stack(
          children: [
            Container(
              width: 240,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.mainCard, // 카드 배경색
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.mainPrimary, width: 2.2), // 메인컬러로 테두리
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.mainShadow, // 테마 그림자
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 35),
                  isLoading
                      ? const SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(AppTheme.mainPrimary),
                    ),
                  )
                      : Row(
                    children: [
                      Image.asset(
                        'assets/google_logo2.png',
                        height: 40,
                        width: 30,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Google',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.mainPrimary, // 메인컬러로 텍스트
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            // 모서리 네 곳에 메인컬러 원
            Positioned(
              top: 7, left: 7, child: _cornerDot(),
            ),
            Positioned(
              top: 7, right: 7, child: _cornerDot(),
            ),
            Positioned(
              bottom: 7, left: 7, child: _cornerDot(),
            ),
            Positioned(
              bottom: 7, right: 7, child: _cornerDot(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cornerDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: AppTheme.mainPrimary, // 메인컬러
        shape: BoxShape.circle,
      ),
    );
  }
}
