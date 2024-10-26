import 'package:flutter/material.dart';

class TechSelectionDialog extends StatelessWidget {
  final Function(Map<String, String>) onTechSelected;

  TechSelectionDialog({required this.onTechSelected});

  // 기술 스택 리스트 정의
  final List<Map<String, String>> techOptions = [
    {'name': 'Amazonwebservices', 'image': 'assets/tech_stack/Amazonwebservices.png'},
    {'name': 'AndroidStudio', 'image': 'assets/tech_stack/AndroidStudio.png'},
    {'name': 'Angular', 'image': 'assets/tech_stack/Angular.png'},
    {'name': 'Babel', 'image': 'assets/tech_stack/Babel.png'},
    {'name': 'Bootstrap', 'image': 'assets/tech_stack/Bootstrap.png'},
    {'name': 'C#', 'image': 'assets/tech_stack/C#.png'},
    {'name': 'C', 'image': 'assets/tech_stack/C.png'},
    {'name': 'C++', 'image': 'assets/tech_stack/C++.png'},
    {'name': 'Codepen', 'image': 'assets/tech_stack/Codepen.png'},
    // 추가 기술 옵션을 여기에 추가
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('기술 선택', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.grey[850],
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: techOptions.length,
            itemBuilder: (context, index) {
              final tech = techOptions[index];
              return GestureDetector(
                onTap: () {
                  onTechSelected(tech); // 기술 선택 시 호출
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        tech['image']!,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        tech['name']!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}