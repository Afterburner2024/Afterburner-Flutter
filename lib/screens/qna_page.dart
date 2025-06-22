import 'package:flutter/material.dart';

class QnAPage extends StatelessWidget {
  const QnAPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // 아이콘 색상 검정
        title: const Text(
          '질문 게시판',
          style: TextStyle(
            color: Colors.black,         // 타이틀 색상 검정
            fontWeight: FontWeight.bold, // (선택) 굵게
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ),
      body: const Center(
        child: Text(
          '이곳은 QnA 게시판 입니다!',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
