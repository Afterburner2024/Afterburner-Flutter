// models/project_post.dart
class ProjectPost {
  final String id;
  final String title;
  final String part; // ex: '프론트엔드', '백엔드'
  final String summary;

  ProjectPost({
    required this.id,
    required this.title,
    required this.part,
    required this.summary,
  });
}

final categories = ['전체', '프론트엔드', '백엔드', '디자인', '기획'];

final List<ProjectPost> dummyPosts = [
  ProjectPost(id: '1', title: 'Flutter 앱 개발자 모집', part: '프론트엔드', summary: 'Flutter로 앱 만드실 분!'),
  ProjectPost(id: '2', title: 'Spring 백엔드 구합니다', part: '백엔드', summary: 'REST API, DB 설계'),
  ProjectPost(id: '3', title: 'UI 디자이너 급구', part: '디자인', summary: 'Figma 능숙자'),
];
