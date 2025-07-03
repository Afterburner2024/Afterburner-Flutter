import 'package:flutter/material.dart';
import '../widgets/mainContent/bottom_nav_bar.dart';

class MainScaffold extends StatelessWidget {
  final int currentIndex;
  final bool isLoggedIn;
  final PreferredSizeWidget? appBar;
  final Widget body;

  const MainScaffold({
    super.key,
    required this.currentIndex,
    required this.isLoggedIn,
    required this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: CustomNavBar(
        currentIndex: currentIndex,
        isLoggedIn: isLoggedIn,
          onTap: (index) {
            final routes = isLoggedIn
                ? ['/', '/study', '/sideproject', '/qna', '/mypage']
                : ['/', '/study', '/sideproject', '/qna', '/login'];
            if (ModalRoute.of(context)?.settings.name != routes[index]) {
              Navigator.pushReplacementNamed(context, routes[index]);
            }
          }
      ),
    );
  }
}
