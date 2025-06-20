import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FreeBoard extends StatelessWidget {
  const FreeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: const Text(
          '자유게시판',
          style: TextStyle(
            color: kPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: kBackground,
        elevation: 1.5,
        iconTheme: const IconThemeData(color: kPrimary),
      ),
      body: ListView(
        children: [
          Card(
            color: kCard,
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 2,
            child: ListTile(
              title: Text(
                '자유 글 제목',
                style: const TextStyle(color: kPrimary, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                '자유 글 내용',
                style: TextStyle(color: kTextSub),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccent,
        foregroundColor: kCard,
        onPressed: () {
          // 글쓰기 화면 이동
        },
        child: const Icon(Icons.edit),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
