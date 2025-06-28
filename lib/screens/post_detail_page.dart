import 'package:flutter/material.dart';
import '../models/project_post.dart';
import '../theme/side_app_theme.dart';
import '../widgets/detail/post_detail_part_chip.dart';
import '../widgets/detail/post_detail_summary.dart';
import '../widgets/detail/post_detail_progress.dart';
import '../widgets/detail/post_detail_status_row.dart';
import '../widgets/detail/post_detail_body.dart';
import '../widgets/detail/post_detail_apply_button.dart';

class PostDetailPage extends StatelessWidget {
  final ProjectPost post;
  final bool isBookmarked;
  final VoidCallback onToggleBookmark;

  const PostDetailPage({
    Key? key,
    required this.post,
    required this.isBookmarked,
    required this.onToggleBookmark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDeadlinePassed = post.deadline.isBefore(DateTime.now());
    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppTheme.mainTextPrimary),
        title: Text(
          post.title,
          style: TextStyle(
            color: AppTheme.mainTextPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            ),
            onPressed: onToggleBookmark,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: AppTheme.mainCard,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                PostDetailPartChip(part: post.part),
                SizedBox(height: 10),
                PostDetailSummary(summary: post.summary),
                SizedBox(height: 16),
                PostDetailProgress(current: post.current, target: post.target),
                SizedBox(height: 10),
                PostDetailStatusRow(
                  isDeadlinePassed: isDeadlinePassed,
                  deadline: post.deadline,
                ),
                Divider(height: 30, color: AppTheme.mainDivider),
                PostDetailBody(detail: post.detail),
                SizedBox(height: 32),
                PostDetailApplyButton(
                  onApply: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('지원/문의 기능은 추후 구현!')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
