import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class PostDetailPartChip extends StatelessWidget {
  final String part;
  const PostDetailPartChip({super.key, required this.part});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(part, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      backgroundColor: AppTheme.mainPrimary,
    );
  }
}
