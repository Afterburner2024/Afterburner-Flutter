import 'package:flutter/material.dart';
import '../widgets/custom_dropdown_button.dart';
import '../widgets/header_menu_button.dart';
import '../boards/study_group_board.dart';
import '../boards/side_project_board.dart';
import '../screens/question_board.dart';
import '../screens/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedHeader = 0;
  String _selectedBoard = '스터디 그룹';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // 로고 버튼 - 클릭 시 홈(/)으로 이동
                GestureDetector(
                  onTap: () {
                    // 홈(루트)로 이동
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
                  child: Image.asset(
                    'assets/logo.png',
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                HeaderMenuButton(
                  label: '홈 피드',
                  isActive: _selectedHeader == 0,
                  onTap: () => setState(() => _selectedHeader = 0),
                ),
                const SizedBox(width: 12),
                HeaderMenuButton(
                  label: '질문 게시판',
                  isActive: _selectedHeader == 1,
                  onTap: () {
                    // 질문 게시판 화면으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuestionBoard()),
                    );
                  },
                ),
                const SizedBox(width: 12),
                HeaderMenuButton(
                  label: '자유 게시판',
                  isActive: _selectedHeader == 2,
                  onTap: () => setState(() => _selectedHeader = 2),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: const Text('로그인'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // 배경 이미지 + 임팩트 문구
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.black.withOpacity(0.3),
              ),
              const Text(
                '성장하고 싶은 개발자를 위한\n스터디 & 프로젝트 플랫폼',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 8)],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 커스텀 드롭다운
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomDropdownButton(
              value: _selectedBoard,
              items: const ['스터디 그룹', '사이드 프로젝트'],
              onChanged: (selected) => setState(() => _selectedBoard = selected),
            ),
          ),
          const SizedBox(height: 24),
          // 선택된 게시판
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _selectedBoard == '스터디 그룹'
                ? const StudyGroupBoard()
                : const SideProjectBoard(),
          ),
        ],
      ),
    );
  }
}
