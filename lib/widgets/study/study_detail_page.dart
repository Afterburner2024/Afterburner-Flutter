import 'package:flutter/material.dart';
import '../../models/study_post.dart';
import '../../theme/side_app_theme.dart';

class StudyDetailPage extends StatelessWidget {
  final StudyPost post;
  const StudyDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDeadlinePassed = post.deadline.isBefore(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          post.title,  // ← 게시물 제목 그대로 사용
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Text(post.title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppTheme.mainTextPrimary)),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isDeadlinePassed ? AppTheme.mainSuccess : AppTheme.mainPrimary.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isDeadlinePassed ? "마감" : "모집중",
                  style: TextStyle(
                    color: isDeadlinePassed ? Colors.white : AppTheme.mainPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Icon(Icons.event, size: 18, color: AppTheme.mainTextHint),
              SizedBox(width: 2),
              Text("마감일: ${post.deadline.year}.${post.deadline.month}.${post.deadline.day}",
                  style: TextStyle(color: AppTheme.mainTextHint, fontSize: 14)),
            ],
          ),
          SizedBox(height: 16),
          Text(post.summary, style: TextStyle(fontSize: 17, color: AppTheme.mainTextSecondary)),
          SizedBox(height: 16),
          LinearProgressIndicator(
            value: post.currentMembers / post.targetMembers,
            color: AppTheme.mainPrimary,
            backgroundColor: AppTheme.mainLavender,
          ),
          SizedBox(height: 6),
          Text('${post.currentMembers}/${post.targetMembers} 명 참여중', style: TextStyle(color: AppTheme.mainTextHint)),
          SizedBox(height: 18),
          Text("카테고리: ${post.category}", style: TextStyle(fontSize: 15, color: AppTheme.mainTextHint)),
          SizedBox(height: 18),
          Text("상세 설명", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          SizedBox(height: 8),
          Text(post.detail, style: TextStyle(fontSize: 16, color: AppTheme.mainTextPrimary)),
          SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 2.5,
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: AppTheme.buttonPositive,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(Icons.send, color: Colors.white),
            label: Text(
              '지원/문의',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // 지원 문의 기능 구현 (예: 메일, 채팅 등)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("지원/문의 기능은 추후 구현 예정!")),
              );
            },
          ),
        ],
      ),
    );
  }
}
