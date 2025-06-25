import 'package:flutter/material.dart';
import '../models/project_post.dart';
import '../theme/app_theme.dart';

class PostDetailPage extends StatelessWidget {
  final ProjectPost post;
  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.mainBackground,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppTheme.mainTextPrimary),
        title: Text(
          post.title,
          style: const TextStyle(
            color: AppTheme.mainTextPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          color: AppTheme.mainCard,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.mainTextPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '카테고리: ${post.part}',
                  style: const TextStyle(
                    color: AppTheme.mainText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  post.summary,
                  style: const TextStyle(
                    fontSize: 17,
                    color: AppTheme.mainTextSecondary,
                  ),
                ),
                const Divider(height: 32, color: AppTheme.mainDivider),
                Text(
                  '여기에 상세 설명 및 모집 조건, 일정, 연락 방법 등 더 많은 정보가 들어갈 수 있습니다.',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppTheme.mainText,
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 2.5,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: AppTheme.buttonPositive,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.send, color: Colors.white),
                    label: const Text(
                      '지원/문의',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('지원/문의 기능은 추후 구현!')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
