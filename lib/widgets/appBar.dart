import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onAdd;

  const CommonAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.mainBackground,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppTheme.mainTextPrimary),
        onPressed: onBack ?? () {
          Navigator.of(context).maybePop();
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppTheme.mainTextPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      // ⬇️ onAdd가 있을 때만 actions에 아이콘 추가!
      actions: onAdd != null
          ? [
        IconButton(
          icon: const Icon(Icons.add_circle, color: AppTheme.mainPrimary, size: 28),
          onPressed: onAdd,
          tooltip: '추가',
        ),
      ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

