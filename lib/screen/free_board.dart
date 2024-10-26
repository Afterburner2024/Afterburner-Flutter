  import 'package:afterburner/widget/custom_app_bar.dart';
  import 'package:flutter/material.dart';



  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: FreeBoardScreen(),
      );
    }
  }


  class FreeBoardScreen extends StatefulWidget {
    @override
    _FreeBoardScreenState createState() => _FreeBoardScreenState();
  }

  class _FreeBoardScreenState extends State<FreeBoardScreen> {
    final List<Post> _posts = []; // 게시글 목록

    void _addPost(Post post) {
      setState(() {
        _posts.add(post);
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Colors.black, // 배경 색상 검은색으로 수정
        body: Stack(
          children: [
            _posts.isEmpty // 게시물이 없을 때
                ? Center(
              child: Text(
                '게시물이 없습니다.',
                style: TextStyle(color: Colors.white, fontSize: 20), // 문구 스타일
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostCard(
                  title: _posts[index].title,
                  date: _posts[index].date,
                  content: _posts[index].content,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter, // 하단 중앙 정렬
              child: Padding(
                padding: const EdgeInsets.all(16.0), // 버튼 주변에 패딩 추가
                child: ElevatedButton(
                  onPressed: () {
                    // 등록 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(onPostAdded: _addPost),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C63EA), // 배경 색상
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // 패딩
                  ),
                  child: const Text(
                    '등록',
                    style: TextStyle(color: Colors.white, fontSize: 18), // 텍스트 색상 흰색
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    }

  }

  class Post {
    final String title;
    final String date;
    final String content;

    Post({required this.title, required this.date, required this.content});
  }

  class PostCard extends StatelessWidget {
    final String title;
    final String date;
    final String content;

    PostCard({required this.title, required this.date, required this.content});

    @override
    Widget build(BuildContext context) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(content),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.notifications),
                  SizedBox(width: 8),
                  Icon(Icons.bookmark),
                  SizedBox(width: 8),
                  Icon(Icons.comment),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  class RegisterPage extends StatefulWidget {
    final Function(Post) onPostAdded;

    RegisterPage({required this.onPostAdded});

    @override
    _RegisterPageState createState() => _RegisterPageState();
  }

  class _RegisterPageState extends State<RegisterPage> {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
    DateTime? selectedDate;

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('게시글 등록', style: TextStyle(color: Colors.white)), // 텍스트 흰색
          backgroundColor: Colors.black, // 배경 검은색
          iconTheme: IconThemeData(color: Colors.white), // 뒤로가기 아이콘 색상 흰색
        ),
        body: Container(
          color: Colors.white, // 바디 영역 배경 흰색
          padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 패딩만 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // 상단 바와 제목 필드 사이의 여백 추가

              // 제목 입력
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: '제목',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
              SizedBox(height: 16),

              // 내용 입력
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  labelText: '내용',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
                maxLines: 6,
              ),
              SizedBox(height: 16),

              // 날짜 선택기
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? '날짜 선택'
                            : '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.calendar_today, color: Colors.black),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              Spacer(), // 여유 공간을 추가하여 버튼을 하단으로 밀어줍니다.

              // 등록 버튼
              Center( // 버튼을 중앙에 배치
                child: ElevatedButton(
                  onPressed: () {
                    String title = titleController.text;
                    String content = contentController.text;
                    String date = selectedDate != null
                        ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                        : '날짜 미설정';

                    widget.onPostAdded(Post(title: title, date: date, content: content));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C63EA), // 버튼 색상
                    padding: EdgeInsets.symmetric(vertical: 10), // 버튼 높이 줄임
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('등록', style: TextStyle(fontSize: 16, color: Colors.white)), // 텍스트 흰색
                ),
              ),
              SizedBox(height: 16), // 버튼 아래 여백 추가 (선택 사항)
            ],
          ),
        ),
      );
    }
  }


