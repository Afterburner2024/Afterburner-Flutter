import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class QuestionWritePage extends StatefulWidget {
  final String category;
  const QuestionWritePage({super.key, required this.category});

  @override
  State<QuestionWritePage> createState() => _QuestionWritePageState();
}

class _QuestionWritePageState extends State<QuestionWritePage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          '${widget.category} 질문 작성',
          style: const TextStyle(
            color: kPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kBackground,
        centerTitle: true,
        elevation: 1.5,
        iconTheme: const IconThemeData(color: kPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '질문 제목',
                  border: OutlineInputBorder(),
                ),
                onSaved: (v) => title = v ?? '',
                validator: (v) => (v == null || v.isEmpty) ? '제목을 입력하세요.' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '질문 내용',
                  border: OutlineInputBorder(),
                ),
                minLines: 5,
                maxLines: 10,
                onSaved: (v) => content = v ?? '',
                validator: (v) => (v == null || v.isEmpty) ? '내용을 입력하세요.' : null,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: kAccent, width: 1.4),
                    foregroundColor: kAccent,
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      Navigator.pop(context, {
                        'title': title,
                        'content': content,
                      });
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: 22),
                      SizedBox(width: 8),
                      Text('등록하기'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
