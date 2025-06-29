import 'package:flutter/material.dart';
import '../models/project_post.dart';
import '../theme/side_app_theme.dart';
import '../widgets/post/post_category_bar.dart';
import '../widgets/post/post_sort_filter_bar.dart';
import '../widgets/post/post_list_view.dart';
import '../widgets/post/post_schedule_dialog.dart';
import 'post_write_page.dart';
import 'post_detail_page.dart';

// Dummy 데이터, 실제론 Provider/Api 등으로 분리 추천
final List<ProjectPost> dummyPosts = [
  ProjectPost(
    id: 1,
    title: '함께 만드는 Flutter 사이드 프로젝트',
    summary: '앱 출시 목표로 스터디 & 협업할 프론트엔드 1명 모집!',
    part: '프론트엔드',
    current: 2,
    target: 3,
    createdAt: DateTime.now().subtract(Duration(days: 2)),
    deadline: DateTime.now().add(Duration(days: 12)),
    isDone: false,
    bookmarks: 8,
    detail: '실제 출시 경험 있는 멤버들과 팀을 이뤄 앱을 만듭니다.\n- 협업툴: Github, Figma\n- 회의: 주 1회(온라인)\n- 현재 참여: 백엔드 1명, 디자이너 1명\n관심 있으신 분은 지원/문의 남겨주세요!',
  ),
];
const categories = ['전체', '프론트엔드', '백엔드', '디자인', '기획', 'PM', 'DevOps', 'AI', 'QA'];
const sortOptions = ['최신순', '마감임박', '인기순'];

class SideProjectPage extends StatefulWidget {
  const SideProjectPage({super.key});
  @override
  State<SideProjectPage> createState() => _SideProjectPageState();
}

class _SideProjectPageState extends State<SideProjectPage> {
  String selectedCategory = '전체';
  String selectedSort = '최신순';
  Set<int> bookmarkedPostIds = {};

  void toggleBookmark(int id) {
    setState(() {
      if (bookmarkedPostIds.contains(id)) {
        bookmarkedPostIds.remove(id);
      } else {
        bookmarkedPostIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts = dummyPosts
        .where((p) => selectedCategory == '전체' || p.part == selectedCategory)
        .where((p) => p.deadline.isAfter(DateTime.now()))
        .toList();

    filteredPosts.sort((a, b) {
      if (selectedSort == '최신순') return b.createdAt.compareTo(a.createdAt);
      if (selectedSort == '마감임박') return a.deadline.compareTo(b.deadline);
      if (selectedSort == '인기순') return b.bookmarks.compareTo(a.bookmarks);
      return 0;
    });

    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.mainTextPrimary),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: Text(
          '사이드 프로젝트',
          style: TextStyle(
            color: AppTheme.mainTextPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(Icons.add_circle, color: AppTheme.mainPrimary, size: 36),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PostWritePage()),
                );
                setState(() {});
              },
              tooltip: "글쓰기",
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PostCategoryBar(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategoryChanged: (cat) => setState(() => selectedCategory = cat),
          ),
          PostSortFilterBar(
            sortOptions: sortOptions,
            selectedSort: selectedSort,
            onSortChanged: (value) => setState(() => selectedSort = value ?? sortOptions[0]),
            onShowSchedule: () {
              showDialog(
                context: context,
                builder: (_) => PostScheduleDialog(posts: filteredPosts),
              );
            },
          ),
          Expanded(
            child: PostListView(
              posts: filteredPosts,
              bookmarkedIds: bookmarkedPostIds,
              onToggleBookmark: (id) {
                setState(() {
                  if (bookmarkedPostIds.contains(id)) {
                    bookmarkedPostIds.remove(id);
                  } else {
                    bookmarkedPostIds.add(id);
                  }
                  // 실제 bookmark count 동기화는 서버/Provider 등에서 처리 필요!
                  final post = dummyPosts.firstWhere((p) => p.id == id);
                  post.bookmarks = bookmarkedPostIds.contains(id) ? post.bookmarks + 1 : post.bookmarks - 1;
                });
              },
              onPostTap: (post) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostDetailPage(
                      post: post,
                      isBookmarked: bookmarkedPostIds.contains(post.id), // 즐겨찾기 여부
                      onToggleBookmark: () => toggleBookmark(post.id),   // 함수 전달
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
