import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/board_card.dart';

class SideProjectBoard extends StatelessWidget {
  const SideProjectBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0, top: 4.0, bottom: 4.0),
          child: Text(
            '사이드 프로젝트 게시판',
            style: TextStyle(
              color: kPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BoardCard(
          title: 'React + Node 커뮤니티 프로젝트',
          description: '웹 개발자 모여라!',
          imageUrl: 'https://picsum.photos/seed/project1/60/60', // 썸네일
          date: '2024.06.21',
        ),
        BoardCard(
          title: '모바일 앱 런칭 팀원 모집',
          description: '기획, 디자인, 백엔드 구합니다.',
          icon: Icons.smartphone, // 대표 아이콘
          date: '2024.06.20',
        ),
      ],
    );
  }
}
