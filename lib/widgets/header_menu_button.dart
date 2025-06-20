import 'package:flutter/material.dart';

class HeaderMenuButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  const HeaderMenuButton({
    required this.label,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: isActive ? Colors.white : Colors.white54,
        textStyle: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
      child: Text(label),
    );
  }
}
