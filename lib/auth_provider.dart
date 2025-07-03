// lib/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;
  bool get isLoggedIn => _user != null;

  AuthProvider() {
    // Firebase 로그인 상태 변화 감지
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  // 구글 로그인
  Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return; // 사용자가 로그인 취소
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    // 이후 authStateChanges()가 상태 자동 갱신
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    // 이후 authStateChanges()가 상태 자동 갱신
  }
}
