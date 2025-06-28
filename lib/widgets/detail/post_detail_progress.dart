import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class PostDetailProgress extends StatelessWidget {
  final int current;
  final int target;
  const PostDetailProgress({super.key, required this.current, required this.target});

  @override
  Widget build(BuildContext context) {
    final double progress = current / target;
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: progress,
            color: AppTheme.mainPrimary,
            backgroundColor: AppTheme.mainLavender,
          ),
        ),
        SizedBox(width: 12),
        Text('$current/$target'),
      ],
    );
  }
}
