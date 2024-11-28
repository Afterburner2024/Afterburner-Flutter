import 'package:flutter/material.dart';

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
        preferredSize: const Size.fromHeight(70.0), // 높이를 조금 늘림
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/'); // 홈으로 이동
                    },
                    child: const Text('홈 피드', style: TextStyle(color: Colors.white)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/questionBoard'); // 질문게시판으로 이동
                    },
                    child: const Text('질문게시판', style: TextStyle(color: Colors.white)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/freeBoard'); // 자유게시판으로 이동
                    },
                    child: const Text('자유게시판', style: TextStyle(color: Colors.white)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login'); // 로그인 화면으로 이동
                    },
                    child: const Text('로그인', style: TextStyle(color: Colors.white)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/myPage'); // 마이페이지로 이동
                    },
                    child: const Text('마이페이지', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 16), // 하단 여백 추가
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
