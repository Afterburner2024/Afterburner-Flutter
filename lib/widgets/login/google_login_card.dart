import 'package:flutter/material.dart';

class GoogleLoginCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;

  const GoogleLoginCard({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: isLoading ? null : onTap,
        child: Stack(
          children: [
            Container(
              width: 240,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 35),
                  isLoading
                      ? const SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  )
                      : Row(
                    children: [
                      Image.asset(
                        'assets/google_logo2.png',
                        height: 40,
                        width: 30,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Google',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            // 모서리 네 곳에 검은 원
            Positioned(
              top: 7, left: 7, child: _cornerDot(),
            ),
            Positioned(
              top: 7, right: 7, child: _cornerDot(),
            ),
            Positioned(
              bottom: 7, left: 7, child: _cornerDot(),
            ),
            Positioned(
              bottom: 7, right: 7, child: _cornerDot(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cornerDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
