import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class WriteCustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final int maxLines;

  const WriteCustomInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppTheme.mainTextPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 15.5,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          style: TextStyle(fontSize: 16.1, color: AppTheme.mainTextPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppTheme.mainTextHint.withOpacity(0.55)),
            filled: true,
            fillColor: AppTheme.mainBackground,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: AppTheme.mainPrimary.withOpacity(0.16), width: 1.3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: AppTheme.mainPrimary.withOpacity(0.16), width: 1.3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: AppTheme.mainPrimary, width: 1.7),
            ),
          ),
        ),
      ],
    );
  }
}
