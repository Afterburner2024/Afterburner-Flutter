import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_provider.dart';
import '../theme/side_app_theme.dart';
import '../models/study_post.dart';
import '../widgets/study/study_category_bar.dart';
import '../widgets/study/study_sort_filter_bar.dart';
import '../widgets/study/study_list_view.dart';
import '../widgets/study/study_schedule_dialog.dart';
import '../widgets/study/study_write_page.dart';
import '../widgets/study/study_detail_page.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/appBar.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  String selectedCategory = '전체';
  String selectedSort = '최신순';
  final List<String> categories = ['전체', '프론트엔드', '백엔드', 'AI', 'CS', '기타'];
  final List<String> sortOptions = ['최신순', '마감임박'];

  List<StudyPost> posts = sampleStudyPosts;

  void onCategoryChanged(String cat) => setState(() => selectedCategory = cat);

  void onSortChanged(String? sort) =>
      setState(() {
        if (sort != null) selectedSort = sort;
      });

  void onShowSchedule() =>
      showDialog(
        context: context,
        builder: (_) => StudyScheduleDialog(posts: posts),
      );

  void onPostTap(StudyPost post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StudyDetailPage(post: post),
      ),
    );
  }

  void onWritePressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StudyWritePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;
    List<StudyPost> filtered = posts
        .where((p) =>
    selectedCategory == '전체' || p.category == selectedCategory)
        .toList();

    return MainScaffold(
      currentIndex: 1,
      isLoggedIn: isLoggedIn,
      appBar: CommonAppBar(
        title: '스터디 페이지',
        onBack: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
        onAdd: onWritePressed, // 오른쪽 버튼 콜백
      ),
      body: Column(
        children: [
          StudyCategoryBar(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategoryChanged: onCategoryChanged,
          ),
          StudySortFilterBar(
            sortOptions: sortOptions,
            selectedSort: selectedSort,
            onSortChanged: onSortChanged,
            onShowSchedule: onShowSchedule,
          ),
          Expanded(
            child: StudyListView(
              posts: filtered,
              onPostTap: onPostTap,
            ),
          ),
        ],
      ),
    );
  }
}
