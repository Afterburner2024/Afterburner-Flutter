import 'package:flutter/material.dart';

class CustomCornerDotCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;

  const CustomCornerDotCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 140,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: color,
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // 아이콘 중앙
                children: [
                  const SizedBox(height: 26),
                  Icon(icon, size: 160, color: color),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          width: 185, // 선 길이 증가
                          height: 1.4,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          desc,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(top: 7, left: 7, child: _CornerDot(color: color)),
            Positioned(top: 7, right: 7, child: _CornerDot(color: color)),
            Positioned(bottom: 7, left: 7, child: _CornerDot(color: color)),
            Positioned(bottom: 7, right: 7, child: _CornerDot(color: color)),
          ],
        ),
      ),
    );
  }
}

class _CornerDot extends StatelessWidget {
  final double size;
  final Color color;

  const _CornerDot({
    this.size = 12,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 1.2,
        ),
      ),
    );
  }
}
