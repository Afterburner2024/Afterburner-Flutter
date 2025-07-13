import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_provider.dart';
import '../theme/side_app_theme.dart';
import '../widgets/login/google_login_card.dart';
import '../widgets/appBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  Future<void> _handleGoogleLogin() async {
    setState(() => isLoading = true);
    try {
      await context.read<AuthProvider>().signInWithGoogle();
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('구글 로그인 실패: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBackground, // 배경 테마색
      appBar: CommonAppBar(
        title: '로그인',
        onBack: () {
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 필요하면 상단 로고 등 추가
            const SizedBox(height: 32),
            GoogleLoginCard(
              onTap: _handleGoogleLogin,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
