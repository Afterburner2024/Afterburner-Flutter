import 'post_status.dart';

class ProjectDTO {
  final int? projectId;
  final String projectTitle;
  final String projectContent;
  final String? projectLink;
  final DateTime? projectCreatedAt;
  final DateTime? projectUpdatedAt;
  final DateTime? projectDeletedAt;
  final DateTime? projectFinishedAt;
  final PostStatus projectStatus;
  final List<String> projectTechStack;
  final int projectUserId;

  ProjectDTO({
    this.projectId,
    required this.projectTitle,
    required this.projectContent,
    this.projectLink,
    this.projectCreatedAt,
    this.projectUpdatedAt,
    this.projectDeletedAt,
    this.projectFinishedAt,
    required this.projectStatus,
    required this.projectTechStack,
    required this.projectUserId,
  });

  factory ProjectDTO.fromJson(Map<String, dynamic> json) {
    return ProjectDTO(
      projectId: json['projectId'] as int?,
      projectTitle: json['projectTitle'] as String,
      projectContent: json['projectContent'] as String,
      projectLink: json['projectLink'] as String?,
      projectCreatedAt: json['projectCreatedAt'] != null
          ? DateTime.parse(json['projectCreatedAt'] as String)
          : null,
      projectUpdatedAt: json['projectUpdatedAt'] != null
          ? DateTime.parse(json['projectUpdatedAt'] as String)
          : null,
      projectDeletedAt: json['projectDeletedAt'] != null
          ? DateTime.parse(json['projectDeletedAt'] as String)
          : null,
      projectFinishedAt: json['projectFinishedAt'] != null
          ? DateTime.parse(json['projectFinishedAt'] as String)
          : null,
      projectStatus: PostStatus.values.byName(json['projectStatus'] as String),
      projectTechStack: List<String>.from(json['projectTechStack'] ?? []),
      projectUserId: json['projectUserId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'projectTitle': projectTitle,
      'projectContent': projectContent,
      'projectLink': projectLink,
      'projectCreatedAt': projectCreatedAt?.toIso8601String(),
      'projectUpdatedAt': projectUpdatedAt?.toIso8601String(),
      'projectDeletedAt': projectDeletedAt?.toIso8601String(),
      'projectFinishedAt': projectFinishedAt?.toIso8601String(),
      'projectStatus': projectStatus.name,
      'projectTechStack': projectTechStack,
      'projectUserId': projectUserId,
    };
  }
}
