import 'package:afterburner/screen/mainpage.dart';
import 'package:afterburner/screen/question_board.dart';
import 'package:flutter/material.dart';
import 'package:afterburner/screen/free_board.dart';
import 'package:afterburner/screen/login.dart';
import 'package:afterburner/screen/my_page.dart';

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
              Image.asset(
                'assets/logo.png',
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FreeBoardScreen(),
                    ),
                  );
                },
                child: const Text('자유게시판', style: TextStyle(color: Colors.white)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: const Text('로그인', style: TextStyle(color: Colors.white)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPageScreen(), // 마이페이지로 이동
                    ),
                  );
                },
                child: const Text('마이페이지', style: TextStyle(color: Colors.white)), // 마이페이지 텍스트 추가
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