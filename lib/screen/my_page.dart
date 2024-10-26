import 'package:flutter/material.dart';
import 'package:afterburner/widget/custom_app_bar.dart';
import 'package:afterburner/widget/tech_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPageScreen(),
    );
  }
}

class MyPageScreen extends StatefulWidget {
  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  String? selectedFilter;
  List<String> userTechStack = []; // 사용자 기술 스택 리스트 (이미지 경로만 포함)

  void _showTechSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TechSelectionDialog(
          onTechSelected: (tech) {
            setState(() {
              userTechStack.add(tech['image']!); // 이미지 경로만 추가
            });
            Navigator.of(context).pop(); // 다이얼로그 닫기
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('우승엽', style: TextStyle(fontSize: 20, color: Colors.white)),
                  Image.asset(
                    'assets/profile.png', // 로고 이미지 경로
                    height: 70,
                    width: 70,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text('github.com/username', style: TextStyle(color: Colors.blue)),
              SizedBox(height: 16),
              Center(
                child: Text('성실하고 책임감 있게 개발하는 흥길통입니다!!', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              SizedBox(height: 16),

              // 기술 선택 버튼
              ElevatedButton(
                onPressed: _showTechSelectionDialog,
                child: Text('기술 추가', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[850],
                ),
              ),

              SizedBox(height: 16), // 기술 추가 버튼과 이미지 사이의 여백 추가

              Wrap(
                spacing: 8,
                alignment: WrapAlignment.start,
                children: userTechStack.map((image) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8), // 아래 여백 추가
                    child: Image.asset(
                      image,
                      height: 40,
                      width: 40,
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 16), // 이미지 아래 여백 추가


              // 필터 버튼
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.grey[850],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('필터 선택', style: TextStyle(color: Colors.white, fontSize: 20)),
                            Divider(color: Colors.white),
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                // 질문게시판 필터 선택 로직 추가
                              },
                              child: Text('질문게시판', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {
                                // 자유게시판 필터 선택 로직 추가
                              },
                              child: Text('자유게시판', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {
                                // 스터디그룹 필터 선택 로직 추가
                              },
                              child: Text('스터디그룹', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {
                                // 사이드 프로젝트 필터 선택 로직 추가
                              },
                              child: Text('사이드 프로젝트', style: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('닫기', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('필터', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[850],
                ),
              ),


              SizedBox(height: 8),

              // 선택된 필터 표시
              if (selectedFilter != null)
                Text('$selectedFilter', style: TextStyle(color: Colors.white)),
              Divider(color: Colors.white),

              // 질문 게시판
              Card(
                color: Colors.grey[850],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('spring boot 로그인 질문!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          Icon(Icons.bookmark, color: Colors.yellow),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('2024-10-08', style: TextStyle(color: Colors.white)),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}