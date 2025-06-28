import 'package:flutter/material.dart';
import '../../models/project_post.dart';
import 'post_card.dart';

class PostListView extends StatelessWidget {
  final List<ProjectPost> posts;
  final Set<int> bookmarkedIds;
  final Function(int) onToggleBookmark;
  final Function(ProjectPost) onPostTap;

  const PostListView({
    super.key,
    required this.posts,
    required this.bookmarkedIds,
    required this.onToggleBookmark,
    required this.onPostTap,
  });

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return Center(child: Text('게시물이 없습니다!'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: posts.length,
      separatorBuilder: (_, __) => SizedBox(height: 8),
      itemBuilder: (_, idx) {
        final post = posts[idx];
        return PostCard(
          post: post,
          isBookmarked: bookmarkedIds.contains(post.id),
          onToggleBookmark: () => onToggleBookmark(post.id),
          onTap: () => onPostTap(post),
        );
      },
    );
  }
}
