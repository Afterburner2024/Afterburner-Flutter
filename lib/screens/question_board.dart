import 'package:flutter/material.dart';
import 'question_write_page.dart';

// 데이터 모델
class QuestionPost {
  final String title;
  final String content;
  final String date;
  final String imageUrl;
  final int comments;
  final bool isFavorite;
  QuestionPost({
    required this.title,
    required this.content,
    required this.date,
    required this.imageUrl,
    this.comments = 0,
    this.isFavorite = false,
  });
}

class QuestionBoard extends StatefulWidget {
  const QuestionBoard({super.key});

  @override
  State<QuestionBoard> createState() => _QuestionBoardState();
}

class _QuestionBoardState extends State<QuestionBoard> {
  final List<String> categories = [
    "백엔드", "프론트엔드", "웹 퍼블리셔", "모바일", "기획"
  ];
  int selectedCategory = 0;

  // 카테고리별 게시글 데이터 (예시)
  final Map<String, List<QuestionPost>> questions = {
    "백엔드": [
      QuestionPost(
        title: "Spring Boot 에러 질문",
        content: "로그를 보니 서버가 제대로 작동하지 않습니다. 도와주세요!",
        date: "2024.06.19",
        imageUrl: "https://picsum.photos/60/60?1",
        comments: 3,
        isFavorite: false,
      ),
    ],
    "프론트엔드": [
      QuestionPost(
        title: "React 상태관리 추천",
        content: "context vs recoil vs zustand 뭐가 좋나요?",
        date: "2024.06.18",
        imageUrl: "https://picsum.photos/60/60?2",
        comments: 1,
        isFavorite: true,
      ),
    ],
    "웹 퍼블리셔": [],
    "모바일": [],
    "기획": [],
  };

  // 게시글 작성 후 추가
  void _addPost(String category, QuestionPost post) {
    setState(() {
      questions[category]?.insert(0, post);
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = categories[selectedCategory];
    final posts = questions[category] ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('질문 게시판')),
      body: Column(
        children: [
          // 카테고리 버튼
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (idx) {
                final isSelected = selectedCategory == idx;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 14),
                  child: ChoiceChip(
                    label: Text(categories[idx]),
                    selected: isSelected,
                    showCheckmark: isSelected,
                    checkmarkColor: Colors.white,
                    selectedColor: Colors.grey[800],
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (_) {
                      setState(() => selectedCategory = idx);
                    },
                  ),
                );
              }),
            ),
          ),
          const Divider(height: 1),
          // 게시글 리스트
          Expanded(
            child: posts.isEmpty
                ? const Center(child: Text('질문이 없습니다.'))
                : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, idx) {
                final post = posts[idx];
                return QuestionCard(
                  post: post,
                  onFavorite: () {
                    setState(() {
                      posts[idx] = QuestionPost(
                        title: post.title,
                        content: post.content,
                        date: post.date,
                        imageUrl: post.imageUrl,
                        comments: post.comments,
                        isFavorite: !post.isFavorite,
                      );
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 글 작성 페이지로 이동, 결과 받기
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuestionWritePage(category: category),
            ),
          );
          if (result != null && result is Map<String, String>) {
            final now = DateTime.now();
            _addPost(
              category,
              QuestionPost(
                title: result['title'] ?? '',
                content: result['content'] ?? '',
                date: "${now.year.toString().padLeft(4, '0')}.${now.month.toString().padLeft(2, '0')}.${now.day.toString().padLeft(2, '0')}",
                imageUrl: "https://picsum.photos/60/60?${now.microsecond}",
              ),
            );
          }
        },
        shape: const CircleBorder(), // 원형 (기본값이지만 명시적으로)
        backgroundColor: Color(0xFFBC041D), // 모던 블루톤
        foregroundColor: Colors.white, // 아이콘 색상
        elevation: 6,
        child: const Icon(Icons.add, size: 28),
      ),

    );
  }
}

class QuestionCard extends StatelessWidget {
  final QuestionPost post;
  final VoidCallback onFavorite;
  const QuestionCard({super.key, required this.post, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF23252D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 좌상단 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                post.imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // 우측 영역
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목 + 아이콘들
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목
                      Expanded(
                        child: Text(
                          post.title,
                          style: const TextStyle(
                            color: Color(0xFFF1F5F9),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // 신고 아이콘
                      IconButton(
                        icon: const Icon(Icons.flag_outlined, size: 18, color: Color(0xFF94A3B8)),
                        onPressed: () {
                          // 신고 로직
                        },
                        tooltip: '신고',
                        splashRadius: 20,
                      ),
                      // 즐겨찾기(북마크)
                      IconButton(
                        icon: Icon(
                          post.isFavorite ? Icons.bookmark : Icons.bookmark_outline,
                          size: 18,
                          color: post.isFavorite ? Colors.amber : const Color(0xFF94A3B8),
                        ),
                        onPressed: onFavorite,
                        tooltip: '즐겨찾기',
                        splashRadius: 20,
                      ),
                      // 댓글
                      IconButton(
                        icon: const Icon(Icons.mode_comment_outlined, size: 18, color: Color(0xFF94A3B8)),
                        onPressed: () {
                          // 댓글 페이지로 이동 등
                        },
                        tooltip: '댓글',
                        splashRadius: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // 날짜
                  Text(
                    post.date,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 내용
                  Text(
                    post.content,
                    style: const TextStyle(
                      color: Color(0xFFF1F5F9),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
