import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  bool isLoading = false;

  void _signup() async {
    setState(() => isLoading = true);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _pwController.text.trim(),
      );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('회원가입 성공! 로그인해주세요')),
      );
    } on FirebaseAuthException catch (e) {
      String msg = '회원가입 실패: ${e.message}';
      if (e.code == 'email-already-in-use') {
        msg = '이미 사용중인 이메일입니다.';
      } else if (e.code == 'weak-password') {
        msg = '비밀번호는 6자 이상이어야 해요.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      setState(() => isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
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
                decoration: const InputDecoration(labelText: '비밀번호 (6자 이상)'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _signup,
                  child: const Text('회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
