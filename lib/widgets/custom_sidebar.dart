import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sidebar_item.dart';
import '../theme/app_theme.dart';

class CustomSidebar extends StatelessWidget {
  final User? user;
  final VoidCallback onClose;
  final void Function(String route) onNavigate;
  final String currentRoute;

  const CustomSidebar({
    super.key,
    required this.user,
    required this.onClose,
    required this.onNavigate,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.sidebarBackground,
      elevation: 24,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        bottomLeft: Radius.circular(32),
      ),
      child: Container(
        width: 290,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppTheme.sidebarProfileBackground,
                  backgroundImage: user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
                  child: user?.photoURL == null ? const Icon(Icons.person, size: 28, color: Colors.white) : null,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? "닉네임",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user?.email ?? "이메일 없음",
                        style: const TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: onClose,
                ),
              ],
            ),
            const SizedBox(height: 36),
            SidebarItem(
              icon: Icons.home,
              text: "홈",
              selected: currentRoute == '/',
              onTap: () => onNavigate('/'),
            ),
            SidebarItem(
              icon: Icons.school,
              text: "스터디",
              selected: currentRoute == '/study',
              onTap: () => onNavigate('/study'),
            ),
            SidebarItem(
              icon: Icons.lightbulb_outline,
              text: "사이드 프로젝트",
              selected: currentRoute == '/sideproject',
              onTap: () => onNavigate('/sideproject'),
            ),
            SidebarItem(
              icon: Icons.forum,
              text: "질문 게시판",
              selected: currentRoute == '/qna',
              onTap: () => onNavigate('/qna'),
            ),
            if (user == null) // 로그인 안했을 때
              SidebarItem(
                icon: Icons.login,
                text: "로그인",
                selected: currentRoute == '/login',
                onTap: () => onNavigate('/login'),
              ),
            if (user != null) ...[ // 로그인 했을 때
            SidebarItem(
            icon: Icons.account_circle,
            text: "마이 페이지",
            selected: currentRoute == '/mypage',
            onTap: () => onNavigate('/mypage'),
            ),
            SidebarItem(
            icon: Icons.logout,
            text: "로그아웃",
            selected: false,
            onTap: () async {
            await FirebaseAuth.instance.signOut();
            onNavigate('/'); // 로그아웃 후 홈으로
               },
              ),
            ],
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
