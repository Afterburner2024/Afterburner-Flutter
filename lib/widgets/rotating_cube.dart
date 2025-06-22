// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// class RotatingCube extends StatefulWidget {
//   const RotatingCube({Key? key}) : super(key: key);
//
//   @override
//   State<RotatingCube> createState() => _RotatingCubeState();
// }
//
// class _RotatingCubeState extends State<RotatingCube> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 8),
//     )..repeat(); // 무한 회전
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildFace(Color color, String text) {
//     return Container(
//       width: 120,
//       height: 120,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(width: 2, color: Colors.black26),
//         boxShadow: [
//           BoxShadow(color: Colors.black26, blurRadius: 8, spreadRadius: 2, offset: Offset(4, 4)),
//         ],
//       ),
//       child: Text(text, style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, child) {
//         // 0 ~ 2π 회전
//         final angle = _controller.value * 2 * math.pi;
//         // Matrix4.identity()에서 3D 회전 적용 (Y, X 축 회전)
//         final matrix = Matrix4.identity()
//           ..setEntry(3, 2, 0.001) // 3D 효과를 위한 perspective
//           ..rotateY(angle)
//           ..rotateX(angle / 2);
//
//         return Center(
//           child: Transform(
//             transform: matrix,
//             alignment: Alignment.center,
//             child: Stack(
//               children: [
//                 // 각 면(6개) 배치
//                 // 1. 앞면
//                 Transform(
//                   transform: Matrix4.identity()..translate(0.0, 0.0, 60.0),
//                   alignment: Alignment.center,
//                   child: _buildFace(Colors.blue, "Front"),
//                 ),
//                 // 2. 뒷면
//                 Transform(
//                   transform: Matrix4.identity()
//                     ..rotateY(math.pi)
//                     ..translate(0.0, 0.0, 60.0),
//                   alignment: Alignment.center,
//                   child: _buildFace(Colors.red, "Back"),
//                 ),
//                 // 3. 오른쪽면
//                 Transform(
//                   transform: Matrix4.identity()
//                     ..rotateY(math.pi / 2)
//                     ..translate(0.0, 0.0, 60.0),
//                   alignment: Alignment.center,
//                   child: _buildFace(Colors.green, "Right"),
//                 ),
//                 // 4. 왼쪽면
//                 Transform(
//                   transform: Matrix4.identity()
//                     ..rotateY(-math.pi / 2)
//                     ..translate(0.0, 0.0, 60.0),
//                   alignment: Alignment.center,
//                   child: _buildFace(Colors.orange, "Left"),
//                 ),
//                 // 5. 윗면
//                 Transform(
//                   transform: Matrix4.identity()
//                     ..rotateX(-math.pi / 2)
//                     ..translate(0.0, 0.0, 60.0),
//                   alignment: Alignment.center,
//                   child: _buildFace(Colors.purple, "Top"),
//                 ),
//                 // 6. 아랫면
//                 Transform(
//                   transform: Matrix4.identity()
//                     ..rotateX(math.pi / 2)
//                     ..translate(0.0, 0.0, 60.0),
//                   alignment: Alignment.center,
//                   child: _buildFace(Colors.brown, "Bottom"),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
