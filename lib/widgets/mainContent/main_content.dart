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

  final List<String> routesWhenLoggedOut = [
    '/',
    '/study',
    '/sideproject',
    '/qna',
    '/login',
  ];

  final List<String> routesWhenLoggedIn = [
    '/',
    '/study',
    '/sideproject',
    '/qna',
    '/mypage',
  ];

  @override
  Widget build(BuildContext context) {
    final double curveHeight = MediaQuery.of(context).size.height * 0.3;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: BottomWaveClipper(),
              child: SizedBox(
                height: curveHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // ★ 밝아지는 그라데이션 적용 부분
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF9E9E9E), // 위: 진한 중간회색, 완전 불투명
                            Color(0x999E9E9E), // 중간: 80% 투명
                            Color(0x339E9E9E), // 아래: 완전 투명, 밝은 회색
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
                                  width: 30,
                                  height: 40,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Afterburner',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              '성장하는 개발자들의\n스터디 & 사이드 프로젝트 플랫폼',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                height: 1.3,
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
            const SizedBox(height: 88),
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
                        ? Colors.grey[700]
                        : const Color(0x339E9E9E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            // 카드 (페이지네이션)
            SizedBox(
              height: 370,
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
                      'color': Color(0xFFFB542F),
                    },
                    {
                      'title': '사이드 프로젝트',
                      'desc': '협업 중심의 사이드 프로젝트!\n기획, 개발, 디자인 모두 OK',
                      'icon': Icons.bolt,
                      'color': Color(0xFFFB542F),
                    },
                    {
                      'title': 'QnA 게시판',
                      'desc': '궁금한 건 언제든 질문!\n실시간 개발자 커뮤니티',
                      'icon': Icons.question_answer,
                      'color': Color(0xFFFB542F),
                    },
                  ];
                  final data = cardPage[idx];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 52),
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
