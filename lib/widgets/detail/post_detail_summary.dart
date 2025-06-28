import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class PostDetailSummary extends StatelessWidget {
  final String summary;
  const PostDetailSummary({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Text(
      summary,
      style: TextStyle(fontSize: 17, color: AppTheme.mainTextSecondary),
    );
  }
}
