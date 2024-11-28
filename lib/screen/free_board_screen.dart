import 'package:afterburner/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '자유게시판',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      body: Stack(
        children: [
          ListView.builder(
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
            child: Container(
              width: 56, // 버튼의 너비
              height: 56, // 버튼의 높이
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // 버튼 색상 검은색
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // 위치
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  // 등록 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(onPostAdded: _addPost),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white, // 아이콘 색상 흰색
                  size: 30, // 아이콘 크기
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
      appBar: AppBar(title: Text('게시글 등록')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: '제목',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: '내용',
                border: OutlineInputBorder(),
              ),
              maxLines: 6, // 여러 줄 입력 가능
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
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
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 등록 로직 추가
                String title = titleController.text;
                String content = contentController.text;
                String date = selectedDate != null
                    ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                    : '날짜 미설정';

                // 게시글 등록
                widget.onPostAdded(Post(title: title, date: date, content: content));

                // 등록 후 이전 화면으로 돌아감
                Navigator.pop(context);
              },
              child: Text('등록'),
            ),
          ],
        ),
      ),
    );
  }
}
