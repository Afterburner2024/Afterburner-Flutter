import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
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
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 1.5,
        automaticallyImplyLeading: false,
        title: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
                  child: Image.asset(
                    'assets/logo.png',
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                HeaderMenuButton(
                  label: '홈 피드',
                  isActive: _selectedHeader == 0,
                  activeColor: kAccent,
                  textColor: kPrimary,
                  onTap: () => setState(() => _selectedHeader = 0),
                ),
                const SizedBox(width: 8),
                HeaderMenuButton(
                  label: '질문 게시판',
                  isActive: _selectedHeader == 1,
                  activeColor: kAccent,
                  textColor: kPrimary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuestionBoard()),
                    );
                  },
                ),
                const SizedBox(width: 8),
                HeaderMenuButton(
                  label: '자유 게시판',
                  isActive: _selectedHeader == 2,
                  activeColor: kAccent,
                  textColor: kPrimary,
                  onTap: () => setState(() => _selectedHeader = 2),
                ),
                const SizedBox(width: 24),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: kCard,
                    backgroundColor: kSecondary,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: kSecondary.withOpacity(0.1)),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Hero 영역
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 340,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(36)),
                  child: Image.asset(
                    'assets/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 340,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(36)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kBackground.withOpacity(0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    '성장하는 개발자들의\n스터디 & 프로젝트 플랫폼',
                    style: TextStyle(
                      color: kPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      shadows: [
                        Shadow(color: Colors.white70, blurRadius: 8),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '지금 바로 다양한 팀원들과 함께 시작하세요!',
                    style: TextStyle(
                      color: kTextSub,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 드롭다운
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: kGray.withOpacity(0.20),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: kGray, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomDropdownButton(
                value: _selectedBoard,
                items: const ['스터디 그룹', '사이드 프로젝트'],
                onChanged: (selected) => setState(() => _selectedBoard = selected),
                backgroundColor: kCard,
                textColor: kPrimary,
                activeColor: kAccent,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // 게시판
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: kGray.withOpacity(0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: kGray, width: 1),
              ),
              padding: const EdgeInsets.all(20),
              child: _selectedBoard == '스터디 그룹'
                  ? const StudyGroupBoard()
                  : const SideProjectBoard(),
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
