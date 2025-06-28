import 'package:flutter/material.dart';
import '../theme/side_app_theme.dart';
import '../widgets/write/write_role_selector.dart';
import '../widgets/write/write_custom_input.dart';
import '../widgets/write/write_target_slider.dart';
import '../widgets/write/write_deadline_picker.dart';

final defaultRoles = ['프론트엔드', '백엔드', '디자인', '기획', 'PM', 'DevOps', 'AI', 'QA'];

class PostWritePage extends StatefulWidget {
  const PostWritePage({super.key});
  @override
  State<PostWritePage> createState() => _PostWritePageState();
}

class _PostWritePageState extends State<PostWritePage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final summaryController = TextEditingController();
  final contentController = TextEditingController();
  final List<String> roles = List.from(defaultRoles);
  String? selectedRole;
  int target = 4;
  DateTime? deadline;

  void addRole(String value) {
    if (value.trim().isEmpty) return;
    if (!roles.contains(value)) {
      setState(() {
        roles.add(value.trim());
        selectedRole = value.trim();
      });
    }
  }

  Future<void> handleAddRole() async {
    String? newRole = await showDialog(
      context: context,
      builder: (_) {
        final ctrl = TextEditingController();
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Text('역할 직접 추가'),
          content: TextField(
            controller: ctrl,
            autofocus: true,
            decoration: InputDecoration(
              hintText: '예: 모바일, AI엔지니어, PM 등',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('취소'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, ctrl.text),
              child: Text('추가'),
            ),
          ],
        );
      },
    );
    if (newRole != null && newRole.trim().isNotEmpty) {
      addRole(newRole);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppTheme.mainTextPrimary),
        title: Text(
          '게시물 작성',
          style: TextStyle(
            color: AppTheme.mainTextPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 430),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Card(
            color: AppTheme.mainCard,
            elevation: 2.5,
            shadowColor: AppTheme.mainShadow,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    // 역할 선택
                    WriteRoleSelector(
                      roles: roles,
                      selectedRole: selectedRole,
                      onChanged: (v) => setState(() => selectedRole = v),
                      onAddRole: handleAddRole,
                    ),
                    const SizedBox(height: 24),
                    WriteCustomInput(
                      controller: titleController,
                      label: '제목',
                      hint: '프로젝트/모집 제목을 입력하세요',
                      validator: (v) => v == null || v.trim().isEmpty ? '제목을 입력하세요' : null,
                    ),
                    const SizedBox(height: 18),
                    WriteCustomInput(
                      controller: summaryController,
                      label: '한줄 소개',
                      hint: '프로젝트/역할 소개를 간단히 입력',
                      validator: (v) => v == null || v.trim().isEmpty ? '한줄 소개를 입력하세요' : null,
                    ),
                    const SizedBox(height: 18),
                    WriteCustomInput(
                      controller: contentController,
                      label: '상세 설명',
                      hint: '상세 내용, 자격 요건, 일정, 연락 방법 등 자세히!',
                      maxLines: 7,
                      validator: (v) => v == null || v.trim().isEmpty ? '내용을 입력하세요' : null,
                    ),
                    const SizedBox(height: 24),
                    WriteTargetSlider(
                      value: target,
                      onChanged: (v) => setState(() => target = v.round()),
                    ),
                    const SizedBox(height: 18),
                    WriteDeadlinePicker(
                      deadline: deadline,
                      onDatePicked: (picked) => setState(() => deadline = picked),
                    ),
                    const SizedBox(height: 26),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2.5,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          backgroundColor: AppTheme.buttonPositive,
                          shadowColor: AppTheme.buttonPositive.withOpacity(0.13),
                        ),
                        onPressed: () {
                          if (selectedRole == null || selectedRole!.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('모집 역할을 선택하세요!'),
                                backgroundColor: AppTheme.mainPrimary,
                              ),
                            );
                            return;
                          }
                          if (deadline == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('마감일을 선택하세요!'),
                                backgroundColor: AppTheme.mainPrimary,
                              ),
                            );
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('임시: 게시물 등록 완료!'),
                                backgroundColor: AppTheme.mainPrimary,
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          '등록하기',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.1, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
