import 'package:flutter/material.dart';
import 'sidebar_item.dart';
import '../theme/app_theme.dart';

class CustomSidebar extends StatelessWidget {
  final VoidCallback onClose;
  const CustomSidebar({super.key, required this.onClose});

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
                  child: const Icon(Icons.person, size: 28, color: Colors.white),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Abu Anwar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text("YouTuber", style: TextStyle(color: Colors.white60, fontSize: 12)),
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
            const Text("BROWSE", style: TextStyle(color: Colors.white54, letterSpacing: 1.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const SidebarItem(icon: Icons.home, text: "Home"),
            const SidebarItem(icon: Icons.search, text: "Search"),
            const SidebarItem(icon: Icons.star, text: "Favorites"),
            const SidebarItem(icon: Icons.help_outline, text: "Help"),
            const SizedBox(height: 22),
            const Divider(color: Colors.white24, height: 1, thickness: 1, endIndent: 10),
            const SizedBox(height: 18),
            const Text("HISTORY", style: TextStyle(color: Colors.white54, letterSpacing: 1.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const SidebarItem(icon: Icons.history, text: "History"),
            const SidebarItem(icon: Icons.notifications_none, text: "Notification", selected: true),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
