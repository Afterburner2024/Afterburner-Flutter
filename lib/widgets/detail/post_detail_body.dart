import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class PostDetailBody extends StatelessWidget {
  final String? detail;
  const PostDetailBody({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Text(
      detail ?? '상세 내용이 없습니다.',
      style: TextStyle(fontSize: 16, color: AppTheme.mainTextPrimary),
    );
  }
}
