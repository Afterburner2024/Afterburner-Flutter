import 'post_status.dart';
import 'study_group_category.dart';

class StudyGroupDTO {
  final int? studyGroupId;
  final StudyGroupCategory studyGroupCategory;
  final String studyGroupTitle;
  final String studyGroupContent;
  final DateTime? studyGroupCreatedAt;
  final DateTime? studyGroupUpdatedAt;
  final PostStatus studyGroupStatus;
  final int studyGroupUserId;

  StudyGroupDTO({
    this.studyGroupId,
    required this.studyGroupCategory,
    required this.studyGroupTitle,
    required this.studyGroupContent,
    this.studyGroupCreatedAt,
    this.studyGroupUpdatedAt,
    required this.studyGroupStatus,
    required this.studyGroupUserId,
  });

  factory StudyGroupDTO.fromJson(Map<String, dynamic> json) {
    return StudyGroupDTO(
      studyGroupId: json['studyGroupId'] as int?,
      studyGroupCategory: StudyGroupCategory.values.byName(json['studyGroupCategory'] as String),
      studyGroupTitle: json['studyGroupTitle'] as String,
      studyGroupContent: json['studyGroupContent'] as String,
      studyGroupCreatedAt: json['studyGroupCreatedAt'] != null
          ? DateTime.parse(json['studyGroupCreatedAt'] as String)
          : null,
      studyGroupUpdatedAt: json['studyGroupUpdatedAt'] != null
          ? DateTime.parse(json['studyGroupUpdatedAt'] as String)
          : null,
      studyGroupStatus: PostStatus.values.byName(json['studyGroupStatus'] as String),
      studyGroupUserId: json['studyGroupUserId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studyGroupId': studyGroupId,
      'studyGroupCategory': studyGroupCategory.name,
      'studyGroupTitle': studyGroupTitle,
      'studyGroupContent': studyGroupContent,
      'studyGroupCreatedAt': studyGroupCreatedAt?.toIso8601String(),
      'studyGroupUpdatedAt': studyGroupUpdatedAt?.toIso8601String(),
      'studyGroupStatus': studyGroupStatus.name,
      'studyGroupUserId': studyGroupUserId,
    };
  }
}
