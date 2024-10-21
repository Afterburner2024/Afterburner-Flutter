import 'package:flutter/material.dart';

class SideProjectCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  final String tags; // 태그 추가
  final List<Map<String, dynamic>> roles; // 역할 추가

  const SideProjectCard({
    Key? key,
    required this.title,
    required this.date,
    required this.content,
    required this.tags, // 태그 매개변수 추가
    required this.roles, // 역할 매개변수 추가
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.black, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 10),
            // 태그 표시
            if (tags.isNotEmpty) ...[
              Text(
                tags, // 태그를 직접 표시
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 10),
            ],
            // 역할 표시
            if (roles.isNotEmpty) ...[
              const Text(
                '역할:',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              ...roles.map((role) {
                return Text(
                  '${role['role']} (${role['count']})', // 역할과 인원 수 표시
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                );
              }).toList(),
              const SizedBox(height: 10),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.zero, // 패딩을 0으로 설정
                  icon: const Icon(Icons.bookmark, color: Colors.yellow),
                  onPressed: () {
                    // 북마크 버튼 클릭 시 동작
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero, // 패딩을 0으로 설정
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    // 좋아요 버튼 클릭 시 동작
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero, // 패딩을 0으로 설정
                  icon: const Icon(Icons.comment, color: Colors.black),
                  onPressed: () {
                    // 댓글 버튼 클릭 시 동작
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
