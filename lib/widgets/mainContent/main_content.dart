import 'package:flutter/material.dart';
import 'bottom_wave_clipper.dart';
import 'custom_corner_dot_card.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final double curveHeight = MediaQuery.of(context).size.height * 0.27;

    return Scaffold(
      backgroundColor: const Color(0xFFFFE5D4), // 밝은 오렌지 배경(AppTheme.mainBackground)
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 상단 오렌지 그라데이션 헤더
            ClipPath(
              clipper: BottomWaveClipper(),
              child: SizedBox(
                height: curveHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // 오렌지 → 밝은 오렌지 그라데이션
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFB542F), // 메인 오렌지
                            Color(0xFFFD9F3B), // 서브 오렌지
                            Color(0xFFFFE5D4), // 밝은 오렌지
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  width: 34,
                                  height: 42,
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Afterburner',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              '성장하는 개발자들의\n스터디 & 사이드 프로젝트 플랫폼',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.3,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 90),
            // 페이지네이션 인디케이터
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (idx) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: _currentPage == idx ? 18 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentPage == idx
                        ? const Color(0xFFFB542F) // 오렌지 포인트
                        : const Color(0xFFFFB998), // 연오렌지(비활성)
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 카드 (페이지네이션)
            SizedBox(
              height: 340,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (idx) => setState(() => _currentPage = idx),
                itemBuilder: (context, idx) {
                  final cardPage = [
                    {
                      'title': '스터디 예시',
                      'desc': '함께 성장하는 개발자 스터디!\n할일, 일정, 기록 등 관리',
                      'icon': Icons.groups_2,
                      'color': const Color(0xFFFB542F), // 메인 오렌지
                      'bgColor': const Color(0xFFFFF3E4), // 카드 배경 연오렌지
                    },
                    {
                      'title': '사이드 프로젝트',
                      'desc': '협업 중심의 사이드 프로젝트!\n기획, 개발, 디자인 모두 OK',
                      'icon': Icons.bolt,
                      'color': const Color(0xFFFB542F), // 서브 오렌지
                      'bgColor': const Color(0xFFFFFAF4), // 더 밝은 오렌지
                    },
                    {
                      'title': 'QnA 게시판',
                      'desc': '궁금한 건 언제든 질문!\n실시간 개발자 커뮤니티',
                      'icon': Icons.question_answer,
                      'color': const Color(0xFFFB542F), // 네이비 포인트
                      'bgColor': const Color(0xFFFFFFFF), // 흰색(심플)
                    },
                  ];
                  final data = cardPage[idx];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: CustomCornerDotCard(
                      icon: data['icon'] as IconData,
                      title: data['title'] as String,
                      desc: data['desc'] as String,
                      color: data['color'] as Color,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
