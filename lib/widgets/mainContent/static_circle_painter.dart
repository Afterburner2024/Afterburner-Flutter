import 'package:flutter/material.dart';

class StaticCircleOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circles = [
      [size.width * 0.12, size.height * 0.80, 48.0, const Color(0xFFFF9100)],
      [size.width * 0.82, size.height * 0.18, 25.0, const Color(0xFF00FFFF)],
      [size.width * 0.34, size.height * 0.50, 19.0, const Color(0xFF39FF14)],
      [size.width * 0.60, size.height * 0.29, 34.0, const Color(0xFFFF1744)],
      [size.width * 0.22, size.height * 0.538, 73.0, const Color(0xFF00FFFF)],
      [size.width * 0.72, size.height * 0.86, 29.0, const Color(0xFFFF9100)],
    ];
    for (final c in circles) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..color = (c[3] as Color).withOpacity(0.48);
      canvas.drawCircle(Offset(c[0] as double, c[1] as double), c[2] as double, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
