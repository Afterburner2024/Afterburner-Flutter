import 'package:flutter/material.dart';

class FreeBoard extends StatelessWidget {
  const FreeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('자유게시판')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('자유 글 제목'),
            subtitle: const Text('자유 글 내용'),
            onTap: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 글쓰기 화면 이동
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
