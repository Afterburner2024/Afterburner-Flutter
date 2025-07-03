import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool isLoggedIn;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.isLoggedIn,
    required this.onTap,
  }) : super(key: key);

  static const List<IconData> iconsWhenLoggedOut = [
    Icons.home,
    Icons.groups_2,
    Icons.bolt,
    Icons.question_answer,
    Icons.login,
  ];

  static const List<IconData> iconsWhenLoggedIn = [
    Icons.home,
    Icons.groups_2,
    Icons.bolt,
    Icons.question_answer,
    Icons.person,
  ];

  static const List<String> labelsWhenLoggedOut = [
    '홈',
    '스터디',
    '프로젝트',
    'QnA',
    '로그인',
  ];

  static const List<String> labelsWhenLoggedIn = [
    '홈',
    '스터디',
    '프로젝트',
    'QnA',
    '마이페이지',
  ];

  @override
  Widget build(BuildContext context) {
    final icons = isLoggedIn ? iconsWhenLoggedIn : iconsWhenLoggedOut;
    final labels = isLoggedIn ? labelsWhenLoggedIn : labelsWhenLoggedOut;
    final indicatorColor = const Color(0xFF3366FF); // 푸른 계열
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF151d2b), // 딥블루
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                spreadRadius: 1,
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFF151d2b),
            elevation: 0,
            currentIndex: currentIndex,
            onTap: onTap,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: List.generate(icons.length, (idx) {
              return BottomNavigationBarItem(
                label: labels[idx],
                icon: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8), // 아이콘을 살짝 내림
                      child: Icon(
                        icons[idx],
                        size: 26,
                      ),
                    ),
                    if (currentIndex == idx)
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 16,
                          height: 6,
                          decoration: BoxDecoration(
                            color: indicatorColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
