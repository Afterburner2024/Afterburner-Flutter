import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/mainContent/main_content.dart';
import '../widgets/main_scaffold.dart';
import '../auth_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Provider.of<AuthProvider>(context).isLoggedIn;

    return MainScaffold(
      currentIndex: 0,
      isLoggedIn: isLoggedIn,
      body: MainContent(),
    );
  }
}
