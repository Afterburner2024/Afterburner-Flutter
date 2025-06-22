import 'package:flutter/material.dart';
import '../widgets/main_content.dart';
import '../widgets/custom_sidebar.dart';
import '../theme/app_theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const double drawerWidth = 290;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  void _toggleDrawer() {
    if (isOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() => isOpen = !isOpen);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.sidebarBackground,
      body: Stack(

          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double slide = drawerWidth * _controller.value;
                double angle = -1.2217 * _controller.value;
                return Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(-slide)
                    ..rotateY(angle),
                  child: child,
                );
              },
              child: MainContent(onMenuTap: _toggleDrawer),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double slide = drawerWidth * (1 - _controller.value);
                return Positioned(
                  top: 0,
                  right: -slide,
                  bottom: 0,
                  child: child!,
                );
              },
              child: CustomSidebar(
                onClose: _toggleDrawer,
                onNavigate: (route) {
                  if (ModalRoute.of(context)?.settings.name != route) {
                    Navigator.pushReplacementNamed(context, route);
                  }
                  _toggleDrawer();
                },
                currentRoute: ModalRoute.of(context)?.settings.name ?? '/',
              ),
            ),
          ],
        ),
    );
  }
}
