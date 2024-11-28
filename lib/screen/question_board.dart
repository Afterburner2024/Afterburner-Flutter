import 'package:flutter/material.dart';
import 'package:afterburner/widget/board_card.dart';

// 질문 모델
class Question {
  final String title;
  final String content;
  final String date;
  final String tags;

  Question({
    required this.title,
    required this.content,
    required this.date,
    required this.tags,
  });
}

// 질문 게시판 메인 화면
class QuestionBoardScreen extends StatefulWidget {
  const QuestionBoardScreen({Key? key}) : super(key: key);

  @override
  _QuestionBoardScreenState createState() => _QuestionBoardScreenState();
}

class _QuestionBoardScreenState extends State<QuestionBoardScreen> {
  final List<Question> questions = [
    Question(
      title: 'spring boot 로그인 질문!',
      content: '제목과 관련된 내용.',
      date: '2024-10-08',
      tags: '#백엔드 #로그인',
    ),
    Question(
      title: '(욕설 제목)',
      content: '욕설 내용.',
      date: '2024-10-08',
      tags: '#관리자',
    ),
    Question(
      title: 'JAVA랑 script랑 뭐가 다른가요?',
      content: '제목과 관련된 내용.',
      date: '2024-10-08',
      tags: '#프로그래밍 #초보',
    ),
  ];

  // 선택된 필터를 관리하는 변수
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          // 상단 카테고리 버튼
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterButton(
                  label: '백엔드',
                  isSelected: selectedFilter == '백엔드',
                  onTap: () {
                    setState(() {
                      selectedFilter = '백엔드';
                    });
                  },
                ),
                FilterButton(
                  label: '프론트엔드',
                  isSelected: selectedFilter == '프론트엔드',
                  onTap: () {
                    setState(() {
                      selectedFilter = '프론트엔드';
                    });
                  },
                ),
                FilterButton(
                  label: '모바일',
                  isSelected: selectedFilter == '모바일',
                  onTap: () {
                    setState(() {
                      selectedFilter = '모바일';
                    });
                  },
                ),
                FilterButton(
                  label: '기획',
                  isSelected: selectedFilter == '기획',
                  onTap: () {
                    setState(() {
                      selectedFilter = '기획';
                    });
                  },
                ),
                FilterButton(
                  label: '퍼블리싱',
                  isSelected: selectedFilter == '퍼블리싱',
                  onTap: () {
                    setState(() {
                      selectedFilter = '퍼블리싱';
                    });
                  },
                ),
                FilterButton(
                  label: '데이터베이스',
                  isSelected: selectedFilter == '데이터베이스',
                  onTap: () {
                    setState(() {
                      selectedFilter = '데이터베이스';
                    });
                  },
                ),
                FilterButton(
                  label: 'DevOps',
                  isSelected: selectedFilter == 'DevOps',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'DevOps';
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return BoardCard(
                  title: question.title,
                  date: question.date,
                  content: question.content,
                  tags: question.tags,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: () {
          // 질문 추가 동작
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// 필터 버튼 위젯
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: isSelected ? Colors.white : Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: isSelected ? Colors.grey : Colors.transparent,
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const QuestionBoardScreen(),
  ));
}
