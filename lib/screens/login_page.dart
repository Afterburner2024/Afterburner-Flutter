// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'signup_page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _pwController = TextEditingController();
//   bool isLoading = false;
//
//   void _login() async {
//     setState(() => isLoading = true);
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _pwController.text.trim(),
//       );
//       Navigator.of(context).pop();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('로그인 성공!')),
//       );
//     } on FirebaseAuthException catch (e) {
//       String msg = '로그인 실패: ${e.message}';
//       if (e.code == 'user-not-found') {
//         msg = '존재하지 않는 이메일입니다.';
//       } else if (e.code == 'wrong-password') {
//         msg = '비밀번호가 틀렸습니다.';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackground,
//       appBar: AppBar(
//         title: const Text(
//           '로그인',
//           style: TextStyle(
//             color: kPrimary,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: kBackground,
//         elevation: 1.5,
//         iconTheme: const IconThemeData(color: kPrimary),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Container(
//               padding: const EdgeInsets.all(24.0),
//               decoration: BoxDecoration(
//                 color: kCard,
//                 borderRadius: BorderRadius.circular(18),
//                 boxShadow: [
//                   BoxShadow(
//                     color: kGray.withOpacity(0.13),
//                     blurRadius: 12,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       labelText: '이메일',
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: _pwController,
//                     decoration: const InputDecoration(labelText: '비밀번호'),
//                     obscureText: true,
//                   ),
//                   const SizedBox(height: 24),
//                   isLoading
//                       ? const CircularProgressIndicator()
//                       : SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _login,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: kAccent,
//                         foregroundColor: kCard,
//                         textStyle: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(14),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       child: const Text('로그인'),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const SignupPage()),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       foregroundColor: kAccent,
//                       textStyle: const TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                     child: const Text('아직 회원이 아니신가요? 회원가입'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
