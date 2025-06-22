import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? AppTheme.sidebarIcon : AppTheme.sidebarIconUnselected,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: selected
                ? AppTheme.sidebarText
                : AppTheme.sidebarText.withOpacity(0.92),
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        horizontalTitleGap: 12,
      ),
    );
  }
}
