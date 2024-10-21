import 'package:afterburner/screen/mainpage.dart';
import 'package:afterburner/screen/question_board.dart';
import 'package:flutter/material.dart';
import 'package:afterburner/screen/free_board_screen.dart';
import 'package:afterburner/screen/login_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          // 메뉴 버튼 클릭 시 동작
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // 알림 버튼 클릭 시 동작
          },
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () {
            // 공유 버튼 클릭 시 동작
          },
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // 검색 버튼 클릭 시 동작
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 로고 이미지를 추가
              Image.asset(
                'assets/logo.png', // 로고 이미지 경로
                height: 40, // 이미지 높이 조정
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(), // MainPage로 이동
                    ),
                  );
                },
                child: const Text('홈 피드', style: TextStyle(color: Colors.white)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionBoardScreen(),
                    ),
                  );
                },
                child: const Text('질문게시판', style: TextStyle(color: Colors.white)),
              ),
              GestureDetector(
                onTap: () {
                  // 자유게시판 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FreeBoardScreen(), // 자유게시판 화면
                    ),
                  );
                },
                child: const Text('자유게시판', style: TextStyle(color: Colors.white)),
              ),
              GestureDetector(
                onTap: () {
                  // 로그인 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(), // 로그인 화면
                    ),
                  );
                },
                child: const Text('로그인', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
