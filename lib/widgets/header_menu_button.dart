import 'package:flutter/material.dart';

// HeaderMenuButton 예시
class HeaderMenuButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Color activeColor;
  final Color textColor;

  const HeaderMenuButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.activeColor = const Color(0xFF3B82F6),
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isActive
            ? BoxDecoration(
          color: activeColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(18),
        )
            : null,
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? activeColor : textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

