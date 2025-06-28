class ProjectPost {
  int id;
  String title;
  String summary;
  String part;
  int current;
  int target;
  DateTime createdAt;
  DateTime deadline;
  bool isDone;
  int bookmarks;
  String detail;

  ProjectPost({
    required this.id,
    required this.title,
    required this.summary,
    required this.part,
    required this.current,
    required this.target,
    required this.createdAt,
    required this.deadline,
    required this.isDone,
    required this.bookmarks,
    required this.detail,
  });
}
