import 'package:afterburner/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';




class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                '시작하기',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text('지금 로그인하고 매일 한 걸음씩'),
              Text('성장의 길을 개척하세요.'),
              SizedBox(height: 40),


              // GitHub 버튼
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // 그림자 위치
                    ),
                  ],
                ),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                    backgroundColor: Colors.transparent, // 투명 배경
                    elevation: 0, // 기본 그림자 제거
                  ),
                  onPressed: () {
                    // GitHub 로그인 로직
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/github.png', height: 24), // GitHub 이미지
                      SizedBox(width: 10),
                      Text('GitHub', style: TextStyle(color: Colors.white)), // 텍스트 색상 변경
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Google 버튼
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // 흰색 배경
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // 그림자 위치
                    ),
                  ],
                ),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                    backgroundColor: Colors.transparent, // 투명 배경
                    elevation: 0, // 기본 그림자 제거
                  ),
                  onPressed: () {
                    // Google 로그인 로직
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/google.png', height: 24), // Google 이미지
                      SizedBox(width: 10),
                      Text('Google', style: TextStyle(color: Colors.black)), // 텍스트 색상 변경
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                '로그인은 개인 정보 보호 정책 및 서비스 약관에 동의하는 것으로 간주하며, '
                    '서비스 이용을 위해 이메일 주소를 입력해야 합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
