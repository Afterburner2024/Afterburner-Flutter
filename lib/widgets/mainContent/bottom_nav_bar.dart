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
    final outlinedIcons = isLoggedIn
        ? [
      Icons.home_outlined,
      Icons.groups_2_outlined,
      Icons.bolt_outlined,
      Icons.question_answer_outlined,
      Icons.person_outline,
    ]
        : [
      Icons.home_outlined,
      Icons.groups_2_outlined,
      Icons.bolt_outlined,
      Icons.question_answer_outlined,
      Icons.login_outlined,
    ];
    final indicatorColor = const Color(0xFFFD9F3B);

    return SafeArea(
      bottom: true,
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: Colors.white,
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
                            child: selected
                                ? Icon(
                              icons[idx],
                              size: 32,
                              color: const Color(0xFFFB542F),
                            )
                                : Icon(
                              outlinedIcons[idx],
                              size: 32,
                              color: Colors.grey[700], // 테두리만 검정, 내부 비움
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
      ),
    );
  }
}
