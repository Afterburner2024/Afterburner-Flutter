import 'package:afterburner/widget/side_project_card.dart';
import 'package:flutter/material.dart';
import 'package:afterburner/widget/board_card.dart';
import 'package:afterburner/widget/custom_app_bar.dart';
import 'package:afterburner/widget/dropdown_menu.dart';
import 'package:afterburner/widget/board_registration_dialog.dart'; // 등록 다이얼로그 가져오기

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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BoardRegistrationPage(
          onRegister: register, // 등록 메서드 전달
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                      const Text(
                        '국비로 시작해, 가능성으로 나아가라!',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '“오늘의 공부가 내일의 정답!”',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                          '스터디 그룹 게시판',
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
