import 'package:afterburner/widget/side_project_card.dart';
import 'package:flutter/material.dart';
import 'package:afterburner/widget/board_card.dart';
import 'package:afterburner/widget/custom_app_bar.dart';
import 'package:afterburner/widget/dropdown_menu.dart';
import 'package:afterburner/widget/board_registration_dialog.dart'; // 스터디 그룹 등록 다이얼로그
import 'package:afterburner/widget/side_project_dialog.dart'; // 사이드 프로젝트 등록 다이얼로그
import 'dart:ui';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? selectedGroup;
  bool showStudyBoard = false;
  bool showSideProjectBoard = false; // 사이드 프로젝트 보드 표시 여부

  List<Map<String, String>> studyBoardItems = [];
  List<Map<String, dynamic>> sideProjectItems = []; // 사이드 프로젝트 항목 리스트

  void register(String title, String date, String content, String tags, List<Map<String, dynamic>> roles) {
    if (selectedGroup == '스터디 그룹') {
      studyBoardItems.add({
        'title': title,
        'date': date,
        'content': content,
        'tags': tags,
      });
    } else if (selectedGroup == '사이드 프로젝트') {
      sideProjectItems.add({
        'title': title,
        'date': date,
        'content': content,
        'tags': tags,
        'roles': roles, // 역할 정보 추가
      });
    }

    setState(() {}); // 상태 업데이트
  }

  void _showRegistrationDialog() {
    if (selectedGroup == '스터디 그룹') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return BoardRegistrationPage(
            onRegister: register, // 등록 메서드 전달
          );
        },
      );
    } else if (selectedGroup == '사이드 프로젝트') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SideProjectDialog(
            onRegister: register, // 등록 메서드 전달
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // 흐릿한 이미지
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // 블러 효과
                            child: Opacity(
                              opacity: 0.5, // 흐림 정도 조절
                              child: Image.asset(
                                'assets/main6.png',
                                width: 400,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // 패턴 오버레이 추가 (예: 점 패턴)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4), // 어두운 반투명 색상
                              backgroundBlendMode: BlendMode.darken, // 배경 혼합 모드
                            ),
                            width: 400,
                            height: 300,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/pattern.png'), // 패턴 이미지
                                    repeat: ImageRepeat.repeat,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 이미지 위의 텍스트
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 텍스트에 그림자 효과 추가
                              const Text(
                                '국비로 시작해, 가능성으로 나아가라!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                '“오늘의 공부가 내일의 정답!”',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      DropdownMenuWidget(
                        selectedGroup: selectedGroup,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGroup = newValue;
                            showStudyBoard = newValue == '스터디 그룹';
                            showSideProjectBoard = newValue == '사이드 프로젝트'; // 사이드 프로젝트 보드 표시 여부 결정
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      if (showStudyBoard) ...[
                        const Text(
                          '스터디 그룹',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ...studyBoardItems.map((item) {
                          return BoardCard(
                            title: item['title'] ?? '',
                            date: item['date'] ?? '',
                            content: item['content'] ?? '',
                            tags: item['tags'] ?? '',
                          );
                        }).toList(),
                      ],
                      if (showSideProjectBoard) ...[
                        const Text(
                          '사이드 프로젝트',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ...sideProjectItems.map((item) {
                          return SideProjectCard(
                            title: item['title'] ?? '',
                            date: item['date'] ?? '',
                            content: item['content'] ?? '',
                            tags: item['tags'] ?? '',
                            roles: item['roles'] ?? [], // 역할 정보 전달
                          );
                        }).toList(),
                      ],
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            // 등록 버튼
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _showRegistrationDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3C63EA),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  '등록',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
