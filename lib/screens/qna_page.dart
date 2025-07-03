import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_provider.dart';
import '../widgets/main_scaffold.dart'; // MainScaffold import!

class QnAPage extends StatelessWidget {
  const QnAPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;
    return MainScaffold(
      currentIndex: 3, // 0:홈, 1:스터디, 2:사이드, 3:QnA, 4:마이페이지/로그인
      isLoggedIn: isLoggedIn,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          '질문 게시판',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
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
