import 'package:flutter/material.dart';
import 'custom_text_field.dart'; // 커스텀 텍스트 필드 위젯 임포트

class BoardRegistrationPage extends StatefulWidget {
  final Function(String, String, String, String, List<Map<String, dynamic>>) onRegister;

  const BoardRegistrationPage({Key? key, required this.onRegister}) : super(key: key);

  @override
  _BoardRegistrationPageState createState() => _BoardRegistrationPageState();
}

class _BoardRegistrationPageState extends State<BoardRegistrationPage> {
  String title = '';
  String date = '';
  String content = '';
  String tags = '';
  String? selectedGroup; // 선택된 그룹
  List<Map<String, dynamic>> roles = [{'role': '', 'count': 1}]; // 역할과 인원 수

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        date = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  void _addRole() {
    setState(() {
      roles.add({'role': '', 'count': 1});
    });
  }

  void _removeRole(int index) {
    setState(() {
      if (roles.length > 1) {
        roles.removeAt(index);
      }
    });
  }

  void _increaseCount(int index) {
    setState(() {
      roles[index]['count']++;
    });
  }

  void _decreaseCount(int index) {
    setState(() {
      if (roles[index]['count'] > 1) {
        roles[index]['count']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시물 등록', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '게시판에 등록할 내용을 입력하세요.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 20),

              // 드롭다운 메뉴
              DropdownButton<String>(
                value: selectedGroup,
                hint: const Text('그룹 선택', style: TextStyle(color: Colors.white)),
                dropdownColor: const Color(0xFF2D2A2A),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                items: <String>['사이드 프로젝트', '스터디 그룹']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 18, color: Colors.white)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGroup = newValue;
                    roles = [{'role': '', 'count': 1}]; // 그룹 변경 시 역할 초기화
                  });
                },
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              ),
              const SizedBox(height: 83),

              // 제목 입력 필드
              CustomTextField(
                label: '제목',
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(height: 20),

              // 날짜 입력 필드
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: CustomTextField(
                    label: '날짜',
                    hintText: date.isEmpty ? '날짜를 선택하세요' : date,
                    onChanged: (value) {}, // 빈 콜백 추가
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 내용 입력 필드
              CustomTextField(
                label: '내용',
                onChanged: (value) {
                  content = value;
                },
              ),
              const SizedBox(height: 20),

              // 태그 입력 필드
              CustomTextField(
                label: '태그 (예: #책임감, #팀워크)',
                onChanged: (value) {
                  tags = value.split(',').map((tag) {
                    return tag.trim().isNotEmpty ? '#${tag.trim()}' : '';
                  }).where((tag) => tag.isNotEmpty).toSet().toList().join(' ');
                },
              ),
              const SizedBox(height: 20),

              const Text(
                '태그는 콤마로 구분하여 입력해주세요.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 20),

              // 역할 추가 필드 (사이드 프로젝트일 때만 표시)
// 역할 추가 필드 (사이드 프로젝트일 때만 표시)
              if (selectedGroup == '사이드 프로젝트') ...[
                const Text(
                  '역할 및 인원 수를 입력하세요.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 20),
                ...roles.map((role) {
                  int index = roles.indexOf(role);
                  return Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: roles[index]['role'].isEmpty ? null : roles[index]['role'],
                          hint: const Text(
                            '역할 선택',
                            style: TextStyle(color: Colors.white),
                          ),
                          dropdownColor: const Color(0xFF2D2A2A),
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                          items: ['백엔드', '프론트엔드', '기획', '디자인', '기타']
                              .map<DropdownMenuItem<String>>((String roleOption) {
                            return DropdownMenuItem<String>(
                              value: roleOption,
                              child: Text(roleOption, style: const TextStyle(fontSize: 18, color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (String? newRole) {
                            setState(() {
                              roles[index]['role'] = newRole ?? '';
                            });
                          },
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.red),
                            onPressed: () => _decreaseCount(index),
                          ),
                          Text(
                            roles[index]['count'].toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.green),
                            onPressed: () => _increaseCount(index),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () => _removeRole(index),
                      ),
                    ],
                  );
                }).toList(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addRole,
                  child: const Text('역할 추가', style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C63EA),
                  ),
                ),
                const SizedBox(height: 20),
              ],


              // 등록 버튼
// 등록 버튼 클릭 이벤트
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (title.isEmpty || date.isEmpty || content.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('모든 필드를 입력하세요.')),
                      );
                      return;
                    }

                    try {
                      if (selectedGroup == '스터디 그룹') {
                        widget.onRegister(title, date, content, tags, []); // 빈 역할 목록 전달
                      } else if (selectedGroup == '사이드 프로젝트') {
                        // 역할이 선택되지 않은 경우 체크
                        for (var role in roles) {
                          if (role['role'].isEmpty || role['count'] < 1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('모든 역할에 대해 유효한 인원 수를 입력하세요.')),
                            );
                            return;
                          }
                        }
                        widget.onRegister(title, date, content, tags, roles); // 역할 목록 전달
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('그룹을 선택하세요.')),
                        );
                        return;
                      }

                      // 등록 후 페이지 닫기
                      Navigator.of(context).pop();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('등록 중 오류가 발생했습니다: $e')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C63EA),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('등록', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
