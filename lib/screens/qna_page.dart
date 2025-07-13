import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_provider.dart';
import '../theme/side_app_theme.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/appBar.dart';

// QnA 질문 더미 데이터
final List<Map<String, dynamic>> questions = [
  {
    'title': 'Flutter setState와 Provider의 차이는?',
    'author': '승엽',
    'date': '2024.07.11',
    'content': 'Flutter에서 setState는 State 내부에서만 상태 변경을 처리하고, Provider는 앱 전역 상태관리 패턴입니다. 차이점과 언제 어떤 걸 써야하는지 궁금합니다!',
    'answers': [
      {
        'author': '김개발',
        'date': '2024.07.11',
        'content': 'setState는 위젯 내부 한정, Provider는 여러 위젯간 데이터 공유가 필요할 때 사용하면 됩니다.'
      }
    ],
  },
  {
    'title': 'Firebase Auth 에러 해결법?',
    'author': '이테스터',
    'date': '2024.07.10',
    'content': 'firebase_auth에서 signInWithEmailAndPassword를 쓸 때 에러가 납니다. common한 실수나 체크포인트가 궁금합니다!',
    'answers': [],
  },
];

class QnAPage extends StatefulWidget {
  const QnAPage({super.key});
  @override
  State<QnAPage> createState() => _QnAPageState();
}

class _QnAPageState extends State<QnAPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;

    // 간단 검색 (실제 데이터는 서버/Provider에서 관리 권장)
    final filtered = questions
        .where((q) => searchQuery.isEmpty ||
        q['title'].toString().contains(searchQuery))
        .toList();

    return MainScaffold(
      currentIndex: 3,
      isLoggedIn: isLoggedIn,
      appBar: CommonAppBar(
        title: '질문 게시판',
        onBack: () => Navigator.of(context).pushReplacementNamed('/'),
        onAdd: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => QnAWritePage()),
          );
          if (result != null) {
            setState(() {
              questions.add(result);
            });
          }
        },
      ),
      body: Column(
        children: [
          // 1. 검색 바
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: '질문을 검색하세요',
                prefixIcon: Icon(Icons.search, color: AppTheme.mainTextHint),
                filled: true,
                fillColor: AppTheme.mainCard,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),
          // 2. 질문 리스트
          Expanded(
            child: ListView.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, __) => Divider(color: AppTheme.mainDivider),
              itemBuilder: (context, i) {
                final q = filtered[i];
                return ListTile(
                  title: Text(
                    q['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${q['author']} · ${q['date']}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => QnADetailPage(question: q),
                    ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QnADetailPage extends StatefulWidget {
  final Map<String, dynamic> question;

  const QnADetailPage({super.key, required this.question});

  @override
  State<QnADetailPage> createState() => _QnADetailPageState();
}

class _QnADetailPageState extends State<QnADetailPage> {
  final TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final question = widget.question;

    return Scaffold(
      appBar: CommonAppBar(
        title: '질문 상세',
        onBack: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppTheme.mainBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 질문 정보
            Text(
              question['title'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('${question['author']} · ${question['date']}',
                style: TextStyle(color: AppTheme.mainTextSecondary)),
            const SizedBox(height: 16),
            Text(
              question['content'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),

            // 답변 목록
            Text(
              '답변 ${question['answers'].length}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: question['answers'].isEmpty
                  ? const Center(
                child: Text(
                  '아직 답변이 없습니다. 첫 답변을 남겨보세요!',
                  style: TextStyle(color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: question['answers'].length,
                itemBuilder: (context, idx) {
                  final ans = question['answers'][idx];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(ans['content']),
                      subtitle: Text(
                        '${ans['author']} · ${ans['date']}',
                        style: TextStyle(
                          color: AppTheme.mainTextSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // 답변 작성 폼
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _answerController,
                    decoration: InputDecoration(
                      hintText: '답변을 입력하세요',
                      filled: true,
                      fillColor: AppTheme.mainCard,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.mainPrimary,
                  ),
                  onPressed: () {
                    final content = _answerController.text.trim();
                    if (content.isNotEmpty) {
                      setState(() {
                        question['answers'].add({
                          'author': '익명',
                          'date': DateTime.now().toString().substring(0, 10),
                          'content': content,
                        });
                        _answerController.clear();
                      });
                    }
                  },
                  child: const Text('등록'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QnAWritePage extends StatefulWidget {
  final Function(Map<String, dynamic> newQuestion)? onSubmit;

  const QnAWritePage({super.key, this.onSubmit});

  @override
  State<QnAWritePage> createState() => _QnAWritePageState();
}

class _QnAWritePageState extends State<QnAWritePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isSubmitting = false;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final newQuestion = {
      'title': _titleController.text.trim(),
      'author': '익명',
      'date': DateTime.now().toString().substring(0, 10),
      'content': _contentController.text.trim(),
      'answers': [],
    };

    // 콜백 사용(부모에서 목록에 추가, 또는 DB 전송)
    if (widget.onSubmit != null) {
      widget.onSubmit!(newQuestion);
    }

    Navigator.of(context).pop(newQuestion); // 작성 완료 후 pop + 결과 반환
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '질문 작성',
        onBack: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppTheme.mainBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '질문 제목',
                  filled: true,
                  fillColor: AppTheme.mainCard,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '제목을 입력해주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '질문 내용',
                  filled: true,
                  fillColor: AppTheme.mainCard,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                minLines: 8,
                maxLines: 16,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '질문 내용을 입력해주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.mainPrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('등록하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}