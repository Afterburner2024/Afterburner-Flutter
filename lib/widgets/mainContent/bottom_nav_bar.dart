import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool isLoggedIn;
  final ValueChanged<int> onTap;

  const CustomNavBar({
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
    final indicatorColor = const Color(0xFF3366FF);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 28),
      child: Container(
        height: 68, // 원하는 바 높이
        decoration: BoxDecoration(
          color: const Color(0xFF151d2b),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (idx) {
            final selected = currentIndex == idx;
            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => onTap(idx),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Icon(
                            icons[idx],
                            size: 32, // 자유롭게 변경
                            color: selected ? Colors.white : Colors.white60,
                          ),
                        ),
                        if (selected)
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 32,
                              height: 4,
                              decoration: BoxDecoration(
                                color: indicatorColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
