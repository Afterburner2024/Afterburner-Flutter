import 'package:flutter/material.dart';
import '../widgets/board_card.dart';

class StudyGroupBoard extends StatelessWidget {
  const StudyGroupBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '스터디 그룹 게시판',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        BoardCard(title: '플러터 입문 스터디 모집', description: '매주 토요일 오전 10시!'),
        BoardCard(title: '알고리즘 공부방', description: '온라인으로 알고리즘 문제 풉니다.'),
      ],
    );
  }
}
