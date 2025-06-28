import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class PostDetailStatusRow extends StatelessWidget {
  final bool isDeadlinePassed;
  final DateTime deadline;
  const PostDetailStatusRow({super.key, required this.isDeadlinePassed, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isDeadlinePassed ? AppTheme.mainSuccess : AppTheme.mainPrimary.withOpacity(0.09),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            isDeadlinePassed ? "마감" : "진행중",
            style: TextStyle(
                color: isDeadlinePassed ? Colors.white : AppTheme.mainPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
        ),
        SizedBox(width: 16),
        Icon(Icons.event, size: 18, color: AppTheme.mainTextHint),
        SizedBox(width: 2),
        Text(
          "마감일: ${deadline.year}.${deadline.month}.${deadline.day}",
          style: TextStyle(color: AppTheme.mainTextHint, fontSize: 14),
        ),
      ],
    );
  }
}
