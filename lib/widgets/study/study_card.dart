import 'package:flutter/material.dart';
import '../../models/study_post.dart';
import '../../theme/side_app_theme.dart';

class StudyCard extends StatelessWidget {
  final StudyPost post;
  final VoidCallback onTap;

  const StudyCard({
    super.key,
    required this.post,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.mainCard,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: AppTheme.mainShadow, blurRadius: 18, offset: Offset(0, 5))],
        ),
        margin: EdgeInsets.only(top: 4, bottom: 4),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목Row: 아이콘-제목
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      post.title,
                      style: TextStyle(
                        color: AppTheme.mainTextPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(post.summary, style: TextStyle(color: AppTheme.mainTextSecondary)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: post.currentMembers / post.targetMembers,
                      color: AppTheme.mainPrimary,
                      backgroundColor: AppTheme.mainLavender,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('${post.currentMembers}/${post.targetMembers}',
                      style: TextStyle(
                          color: AppTheme.mainTextHint, fontWeight: FontWeight.bold)),
                  SizedBox(width: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: post.isClosed
                          ? AppTheme.mainSuccess
                          : AppTheme.mainPrimary.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      post.isClosed ? "마감" : "모집중",
                      style: TextStyle(
                          color: post.isClosed ? Colors.white : AppTheme.mainPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.event, size: 18, color: AppTheme.mainTextHint),
                  SizedBox(width: 3),
                  Text(
                    "마감일: ${post.deadline.year}.${post.deadline.month}.${post.deadline.day}",
                    style: TextStyle(
                        color: AppTheme.mainTextHint, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
