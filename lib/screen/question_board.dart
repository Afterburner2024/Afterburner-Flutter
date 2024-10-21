import 'package:afterburner/screen/mainpage.dart';
import 'package:afterburner/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

// 질문 모델
class Question {
  final String title;
  final String content;
  final String author;

  Question({required this.title, required this.content, required this.author});
}

// 질문 상세 화면
class QuestionDetailScreen extends StatelessWidget {
  final Question question;

  const QuestionDetailScreen({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(question.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('작성자: ${question.author}', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(question.content),
          ],
        ),
      ),
    );
  }
}

// 질문 게시판 카테고리 선택 화면
class QuestionBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), // CustomAppBar 사용
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              '업무 분야에 맞게 질문해보세요!!',
              style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Roboto'), // 폰트 적용
            ),
            SizedBox(height: 20),
            // 첫 번째 행
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(label: 'Backend', icon: Icons.developer_board), // 영어로 변경
                CategoryButton(label: 'Frontend', icon: Icons.web), // 영어로 변경
              ],
            ),
            // 두 번째 행
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(label: 'Publishing', icon: Icons.publish), // 영어로 변경
                CategoryButton(label: 'Planning', icon: Icons.assignment), // 영어로 변경
              ],
            ),
            // 세 번째 행 (모바일 카테고리)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryButton(label: 'Mobile', icon: Icons.mobile_friendly), // 영어로 변경
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 카테고리 버튼 위젯
class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryButton({Key? key, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // 버튼 클릭 시 동작
            print('$label button clicked');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 24),
                SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Roboto'), // 폰트 적용
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
