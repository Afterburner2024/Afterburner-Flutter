import 'package:flutter/material.dart';

class AfterbernerLogo extends StatelessWidget {
  const AfterbernerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Afterberner.png',
      height: 420, // 필요시 크기 조정
      fit: BoxFit.contain,
    );
  }
}
