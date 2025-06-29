import 'package:flutter/material.dart';
import '../../models/study_post.dart';
import 'study_card.dart';

class StudyListView extends StatelessWidget {
  final List<StudyPost> posts;
  final Function(StudyPost) onPostTap;

  const StudyListView({
    super.key,
    required this.posts,
    required this.onPostTap,
  });

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return Center(child: Text('스터디가 없습니다!'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: posts.length,
      separatorBuilder: (_, __) => SizedBox(height: 8),
      itemBuilder: (_, idx) {
        final post = posts[idx];
        return StudyCard(
          post: post,
          onTap: () => onPostTap(post),
        );
      },
    );
  }
}
