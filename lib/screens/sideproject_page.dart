import 'package:flutter/material.dart';

class SideProjectPage extends StatelessWidget {
  const SideProjectPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // 아이콘 색상 검정
        title: const Text(
          '사이드 프로젝트',
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
          '이곳은 사이드 프로젝트 입니다!',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
