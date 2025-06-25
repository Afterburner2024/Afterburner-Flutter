import 'package:flutter/material.dart';
import '../models/project_post.dart';
import 'post_write_page.dart';
import 'post_detail_page.dart';
import '../theme/app_theme.dart';

class SideProjectPage extends StatefulWidget {
  const SideProjectPage({super.key});
  @override
  State<SideProjectPage> createState() => _SideProjectPageState();
}

class _SideProjectPageState extends State<SideProjectPage> {
  String selectedCategory = '전체';

  @override
  Widget build(BuildContext context) {
    final filteredPosts = selectedCategory == '전체'
        ? dummyPosts
        : dummyPosts.where((p) => p.part == selectedCategory).toList();

    return Scaffold(
      // 앱의 메인 배경색
      backgroundColor: AppTheme.mainBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppTheme.mainText),
        title: Text(
          '사이드 프로젝트',
          style: const TextStyle(
            color: AppTheme.mainTextPrimary, // 헤더용 진한 색상
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppTheme.mainText,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add, color: AppTheme.mainPrimary),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PostWritePage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 카테고리 Chip Bar
          Container(
            width: double.infinity,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((cat) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(
                      cat,
                      style: TextStyle(
                        color: selectedCategory == cat
                            ? Colors.white
                            : AppTheme.mainTextSecondary, // 595959
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    selected: selectedCategory == cat,
                    selectedColor: AppTheme.mainPrimary, // 3C63EA
                    backgroundColor: AppTheme.mainBackground,
                    elevation: selectedCategory == cat ? 2 : 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    side: BorderSide(
                      color: selectedCategory == cat
                          ? AppTheme.mainPrimary
                          : AppTheme.mainDivider,
                      width: 1.2,
                    ),
                    onSelected: (_) => setState(() => selectedCategory = cat),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    visualDensity: VisualDensity.compact,
                  ),
                )).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: filteredPosts.length,
              separatorBuilder: (_, __) => Divider(
                color: AppTheme.mainDivider,
                height: 1,
              ),
              itemBuilder: (_, idx) {
                final post = filteredPosts[idx];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppTheme.mainCard,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.mainTextSecondary.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(18),
                    title: Text(
                      post.title,
                      style: const TextStyle(
                        color: AppTheme.mainTextPrimary, // 0D0D0D
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        post.summary,
                        style: TextStyle(
                          color: AppTheme.mainTextSecondary, // 595959
                          fontSize: 15,
                        ),
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.mainPrimary,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.mainPrimary.withOpacity(0.18),
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        post.part,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PostDetailPage(post: post)),
                      );
                    },
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
