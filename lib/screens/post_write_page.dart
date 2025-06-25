import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

final roles = ['프론트엔드', '백엔드', '디자인', '기획', 'PM', 'DevOps', 'AI', 'QA'];

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
  final Set<String> selectedRoles = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.mainBackground,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppTheme.mainText),
        title: Text(
          '게시물 작성',
          style: const TextStyle(
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
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Card(
            color: AppTheme.mainCard,
            elevation: 2.5,
            shadowColor: AppTheme.mainPrimary.withOpacity(0.10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      '모집 역할 선택',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.mainTextPrimary,
                        fontSize: 17,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Gradient Chip
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: roles.map((role) {
                        final isSelected = selectedRoles.contains(role);
                        return InkWell(
                          borderRadius: BorderRadius.circular(17),
                          onTap: () {
                            setState(() {
                              isSelected ? selectedRoles.remove(role) : selectedRoles.add(role);
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: isSelected ? AppTheme.mainFlameGradient : null,
                              color: isSelected
                                  ? null
                                  : AppTheme.mainBackground,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : AppTheme.mainPrimary.withOpacity(0.30),
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(17),
                              boxShadow: [
                                if (isSelected)
                                  BoxShadow(
                                    color: AppTheme.mainPrimary.withOpacity(0.13),
                                    blurRadius: 7,
                                    offset: const Offset(0, 2),
                                  ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                                  color: isSelected ? Colors.white : AppTheme.mainPrimary,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  role,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : AppTheme.mainText,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                    fontSize: 15.2,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 28),
                    // 제목
                    _CustomInput(
                      controller: titleController,
                      label: '제목',
                      hint: '프로젝트/모집 제목을 입력하세요',
                      validator: (v) => v == null || v.trim().isEmpty ? '제목을 입력하세요' : null,
                    ),
                    const SizedBox(height: 18),
                    // 한줄 소개
                    _CustomInput(
                      controller: summaryController,
                      label: '한줄 소개',
                      hint: '프로젝트/역할 소개를 간단히 입력',
                      validator: (v) => v == null || v.trim().isEmpty ? '한줄 소개를 입력하세요' : null,
                    ),
                    const SizedBox(height: 18),
                    // 내용
                    _CustomInput(
                      controller: contentController,
                      label: '상세 설명',
                      hint: '상세 내용, 자격 요건, 일정, 연락 방법 등 자세히!',
                      maxLines: 7,
                      validator: (v) => v == null || v.trim().isEmpty ? '내용을 입력하세요' : null,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2.5,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          backgroundColor: AppTheme.buttonPositive, // 파란색 단일 배경
                          shadowColor: AppTheme.buttonPositive.withOpacity(0.13),
                          // overlayColor는 기본값(흰색 살짝) 그대로 두거나 필요시 따로 지정 가능
                        ),
                        onPressed: () {
                          if (selectedRoles.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('모집 역할을 한 개 이상 선택하세요!'),
                                backgroundColor: AppTheme.mainPrimary,
                              ),
                            );
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('임시: 게시물 등록 완료!'),
                                backgroundColor: AppTheme.mainPrimary,
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          '등록하기',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                            color: Colors.white,
                          ),
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

class _CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final int maxLines;

  const _CustomInput({
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppTheme.mainTextPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 15.5,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 16.1, color: AppTheme.mainText),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppTheme.mainTextSecondary.withOpacity(0.44)),
            filled: true,
            fillColor: AppTheme.mainBackground,
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: AppTheme.mainPrimary.withOpacity(0.16), width: 1.3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: AppTheme.mainPrimary.withOpacity(0.16), width: 1.3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: AppTheme.mainPrimary, width: 1.7),
            ),
          ),
        ),
      ],
    );
  }
}
