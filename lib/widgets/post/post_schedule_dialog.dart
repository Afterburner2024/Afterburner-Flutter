import 'package:flutter/material.dart';
import '../../models/project_post.dart';
import '../../theme/side_app_theme.dart';

class PostScheduleDialog extends StatelessWidget {
  final List<ProjectPost> posts;

  const PostScheduleDialog({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 48),
      child: Container(
        width: 500,
        height: 540,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.event, color: AppTheme.mainPrimary),
                SizedBox(width: 8),
                Text("모집 일정", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: AppTheme.mainTextSecondary),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: posts.isEmpty
                    ? [Center(child: Text('모집 중인 게시물이 없습니다.', style: TextStyle(color: AppTheme.mainTextHint)))]
                    : posts.map((p) => ListTile(
                  leading: Icon(Icons.group, color: AppTheme.mainPrimary),
                  title: Text(
                    p.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      "마감일: ${p.deadline.year}.${p.deadline.month}.${p.deadline.day}"),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
