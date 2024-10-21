import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label; // 레이블
  final String? hintText; // 힌트 텍스트
  final ValueChanged<String> onChanged; // 값 변경 시 호출되는 콜백

  const CustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white), // 텍스트 색상
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey), // 힌트 텍스트 색상
        labelStyle: const TextStyle(color: Colors.white), // 레이블 색상
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게
          borderSide: const BorderSide(color: Colors.white), // 테두리 색상
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white), // 포커스 없을 때 테두리 색상
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue), // 포커스 있을 때 테두리 색상
        ),
      ),
    );
  }
}
