import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class PostDetailApplyButton extends StatelessWidget {
  final VoidCallback onApply;
  const PostDetailApplyButton({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        icon: Icon(Icons.send, color: Colors.white),
        label: Text(
          '지원/문의',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onApply,
      ),
    );
  }
}
