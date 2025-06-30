import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MainContent extends StatelessWidget {
  final VoidCallback onMenuTap;
  const MainContent({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.mainCard,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 바
          Row(
            children: [
              Text(
                'Afterburner',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: AppTheme.mainText,
                  letterSpacing: 1.5,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.menu, size: 32, color: AppTheme.mainText),
                onPressed: onMenuTap,
              ),
            ],
          ),
          const SizedBox(height: 18),

          // 메인 설명
          Text(
            '성장하는 개발자들의\n스터디 & 사이드 프로젝트 플랫폼',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppTheme.mainText,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 36),

          // 1. 스터디 카드
          _ServiceCard(
            icon: Icons.groups_2,
            title: "스터디",
            desc: "함께 성장하는 개발자 스터디\n일정, 할일, 출석, 기록 등",
          ),
          const SizedBox(height: 16),

          // 2. 사이드 프로젝트 카드
          _ServiceCard(
            icon: Icons.bolt,
            title: "사이드 프로젝트",
            desc: "협업 기반 프로젝트 매칭\n기획, 개발, 디자인이 모이는 곳",
          ),
          const SizedBox(height: 16),

          // 3. 질문 게시판 카드
          _ServiceCard(
            icon: Icons.question_answer,
            title: "질문 게시판",
            desc: "개발, 프로젝트, 진로 등\n자유롭게 질문하고 소통할 수 있는 공간",
          ),
          const SizedBox(height: 16),

          // 4. 로그인(구글) 카드
          _ServiceCard(
            icon: Icons.login,
            title: "로그인 (Google)",
            desc: "Firebase Google 로그인을 제공합니다.",
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.mainCardSecondary,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, size: 40, color: AppTheme.mainAccent),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: AppTheme.mainText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.mainTextSecondary,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
