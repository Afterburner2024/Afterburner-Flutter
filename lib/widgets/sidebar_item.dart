import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  const SidebarItem({
    super.key,
    required this.icon,
    required this.text,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: selected
          ? BoxDecoration(
        color: AppTheme.sidebarSelected,
        borderRadius: BorderRadius.circular(12),
      )
          : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? AppTheme.sidebarIcon : AppTheme.sidebarIconUnselected, // ⭐️
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
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        horizontalTitleGap: 12,
      ),
    );
  }
}
