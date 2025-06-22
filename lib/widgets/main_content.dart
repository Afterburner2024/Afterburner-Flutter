import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MainContent extends StatelessWidget {
  final VoidCallback onMenuTap;
  const MainContent({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.mainCard,
      child: Column(
        children: [
          SizedBox(
            height: 90,
            child: Row(
              children: [
                Expanded(child: Container()),
                IconButton(
                  icon: Icon(Icons.menu, size: 32, color: AppTheme.mainText),
                  onPressed: onMenuTap,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '성장하는 개발자들의\n스터디 & 프로젝트 플랫폼',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.mainText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
