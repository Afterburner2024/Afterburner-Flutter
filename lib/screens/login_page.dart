import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  bool isLoading = false;

  void _login() async {
    setState(() => isLoading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _pwController.text.trim(),
      );
      // 로그인 성공 시 홈으로 이동 또는 원하는 페이지 이동
      Navigator.of(context).pop(); // 또는 pushReplacement 등 원하는대로!
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('로그인 성공!')),
      );
    } on FirebaseAuthException catch (e) {
      String msg = '로그인 실패: ${e.message}';
      if (e.code == 'user-not-found') {
        msg = '존재하지 않는 이메일입니다.';
      } else if (e.code == 'wrong-password') {
        msg = '비밀번호가 틀렸습니다.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: '이메일'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _pwController,
                decoration: const InputDecoration(labelText: '비밀번호'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('로그인'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // 회원가입 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupPage()),
                  );
                },
                child: const Text('아직 회원이 아니신가요? 회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
