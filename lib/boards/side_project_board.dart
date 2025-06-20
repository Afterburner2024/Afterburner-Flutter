import 'package:flutter/material.dart';
import '../widgets/board_card.dart';

class SideProjectBoard extends StatelessWidget {
  const SideProjectBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '사이드 프로젝트 게시판',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        BoardCard(title: 'React + Node 커뮤니티 프로젝트', description: '웹 개발자 모여라!'),
        BoardCard(title: '모바일 앱 런칭 팀원 모집', description: '기획, 디자인, 백엔드 구합니다.'),
      ],
    );
  }
}
