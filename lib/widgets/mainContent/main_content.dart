import 'package:flutter/material.dart';
import 'bottom_wave_clipper.dart';
import 'static_circle_painter.dart';
import 'custom_corner_dot_card.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int _currentPage = 0; // BottomNavBar index (0=홈)
  final PageController _pageController = PageController();

  // 실제 앱에서는 Provider, Firebase 등과 연동!
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
    final double curveHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 상단 곡선 + 정적 원
            ClipPath(
              clipper: BottomWaveClipper(),
              child: SizedBox(
                height: curveHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Color(0xFF151d2b),
                          ],
                        ),
                      ),
                    ),
                    CustomPaint(
                      painter: StaticCircleOutlinePainter(),
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
                                  height: 30,
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
            const SizedBox(height: 28),
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
                        ? Colors.blueAccent
                        : Colors.grey[500],
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
                      'color': Colors.orangeAccent,
                    },
                    {
                      'title': '사이드 프로젝트',
                      'desc': '협업 중심의 사이드 프로젝트!\n기획, 개발, 디자인 모두 OK',
                      'icon': Icons.bolt,
                      'color': Colors.redAccent,
                    },
                    {
                      'title': 'QnA 게시판',
                      'desc': '궁금한 건 언제든 질문!\n실시간 개발자 커뮤니티',
                      'icon': Icons.question_answer,
                      'color': Colors.blueAccent,
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
