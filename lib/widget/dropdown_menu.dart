import 'package:flutter/material.dart';

class DropdownMenuWidget extends StatelessWidget {
  final String? selectedGroup; // 선택된 그룹
  final ValueChanged<String?> onChanged; // 변경 시 호출되는 콜백

  const DropdownMenuWidget({
    Key? key,
    required this.selectedGroup,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButton<String>(
        value: selectedGroup, // 선택된 값
        hint: const Text(
          '그룹 선택',
          style: TextStyle(color: Colors.white),
        ),
        dropdownColor: const Color(0xFF2D2A2A),
        style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
        iconSize: 30,
        items: <String>['사이드 프로젝트', '스터디 그룹']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))),
          );
        }).toList(),
        onChanged: onChanged, // 콜백 호출
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      ),
    );
  }
}
