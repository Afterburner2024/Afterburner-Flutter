import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class StudyWritePage extends StatefulWidget {
  const StudyWritePage({super.key});

  @override
  State<StudyWritePage> createState() => _StudyWritePageState();
}

class _StudyWritePageState extends State<StudyWritePage> {
  final _formKey = GlobalKey<FormState>();

  // 카테고리 등
  final List<String> categories = ['프론트엔드', '백엔드', 'AI', 'CS', '기타'];
  String? selectedCategory;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  DateTime? selectedDeadline;
  int targetMembers = 4;

  // 마감일 DatePicker
  Future<void> _pickDeadline() async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDeadline ?? now.add(Duration(days: 7)),
      firstDate: now,
      lastDate: now.add(Duration(days: 180)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: AppTheme.mainCard),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => selectedDeadline = picked);
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;

    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("카테고리를 선택해주세요.")));
      return;
    }
    if (selectedDeadline == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("마감일을 선택해주세요.")));
      return;
    }

    // 실제 등록 처리(서버 연동 등) 대신 성공 알림
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("스터디가 등록되었습니다!")));
    Navigator.of(context).pop(); // 등록 완료 후 페이지 닫기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스터디 모집 등록', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: 6,
            color: AppTheme.mainCard,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 카테고리 선택
                    Text("카테고리", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        fillColor: AppTheme.mainBackground,
                        filled: true,
                      ),
                      hint: Text("카테고리 선택"),
                      items: categories.map((cat) =>
                          DropdownMenuItem(value: cat, child: Text(cat))).toList(),
                      onChanged: (val) => setState(() => selectedCategory = val),
                      validator: (v) => v == null ? "카테고리를 선택하세요." : null,
                    ),
                    SizedBox(height: 18),

                    // 제목
                    Text("스터디명", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: titleController,
                      validator: (v) => v == null || v.trim().isEmpty ? "스터디명을 입력하세요." : null,
                      decoration: InputDecoration(
                        hintText: "예) AI 논문 읽기 스터디",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                        filled: true,
                        fillColor: AppTheme.mainBackground,
                      ),
                    ),
                    SizedBox(height: 18),

                    // 요약
                    Text("한줄 소개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: summaryController,
                      validator: (v) => v == null || v.trim().isEmpty ? "한줄 소개를 입력하세요." : null,
                      decoration: InputDecoration(
                        hintText: "스터디를 간단히 설명해주세요.",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                        filled: true,
                        fillColor: AppTheme.mainBackground,
                      ),
                    ),
                    SizedBox(height: 18),

                    // 상세 설명
                    Text("상세 설명", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: detailController,
                      validator: (v) => v == null || v.trim().isEmpty ? "상세 설명을 입력하세요." : null,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "스터디 진행 방식, 주제, 참여 조건 등을 자세히 적어주세요.",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        filled: true,
                        fillColor: AppTheme.mainBackground,
                      ),
                    ),
                    SizedBox(height: 18),

                    // 모집 인원 슬라이더
                    Text("모집 인원: $targetMembers명", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Slider(
                      value: targetMembers.toDouble(),
                      min: 2,
                      max: 20,
                      divisions: 18,
                      label: "$targetMembers명",
                      activeColor: AppTheme.mainPrimary,
                      inactiveColor: AppTheme.mainLavender,
                      onChanged: (val) => setState(() => targetMembers = val.round()),
                    ),
                    SizedBox(height: 18),

                    // 마감일 선택
                    Text("모집 마감일", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedDeadline == null
                                ? "마감일을 선택하세요."
                                : "${selectedDeadline!.year}.${selectedDeadline!.month.toString().padLeft(2, '0')}.${selectedDeadline!.day.toString().padLeft(2, '0')}",
                            style: TextStyle(
                                color: AppTheme.mainPrimary,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                        TextButton.icon(
                          icon: Icon(Icons.event, color: AppTheme.mainPrimary, size: 22),
                          label: Text("날짜 선택"),
                          onPressed: _pickDeadline,
                        )
                      ],
                    ),
                    SizedBox(height: 26),

                    // 등록 버튼
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.buttonPositive,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _submit,
                        child: Text("등록하기", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white)),
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
