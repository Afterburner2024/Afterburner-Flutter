import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import '../auth_provider.dart'; // Provider import!

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    try {
      await context.read<AuthProvider>().signOut();
      // 로그아웃 후 로그인 페이지로 이동
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그아웃 실패: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/'); // 루트로 이동
          },
        ),
        title: const Text(
          '마이 페이지',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          if (user != null)
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.black),
              tooltip: '로그아웃',
              onPressed: () => _handleLogout(context),
            ),
        ],
      ),
      body: Center(
        child: user == null
            ? const Text('로그인이 필요합니다.')
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: user.photoURL != null
                  ? NetworkImage(user.photoURL!)
                  : null,
              child: user.photoURL == null
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            const SizedBox(height: 16),
            Text(user.displayName ?? 'No Name'),
            Text(user.email ?? 'No Email'),
            const SizedBox(height: 24),
            // 로그아웃 버튼(아래쪽에도 배치)
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('로그아웃'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(160, 44),
              ),
              onPressed: () => _handleLogout(context),
            ),
          ],
        ),
      ),
    );
  }
}
