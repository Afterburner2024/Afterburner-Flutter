import 'post_status.dart';

class NoticeDTO {
  final int? noticeId;
  final String noticeTitle;
  final String noticeContent;
  final PostStatus noticeStatus;
  final DateTime? noticeCreatedAt;
  final DateTime? noticeUpdatedAt;
  final DateTime? noticeDeletedAt;

  NoticeDTO({
    this.noticeId,
    required this.noticeTitle,
    required this.noticeContent,
    required this.noticeStatus,
    this.noticeCreatedAt,
    this.noticeUpdatedAt,
    this.noticeDeletedAt,
  });

  factory NoticeDTO.fromJson(Map<String, dynamic> json) {
    return NoticeDTO(
      noticeId: json['noticeId'] as int?,
      noticeTitle: json['noticeTitle'] as String,
      noticeContent: json['noticeContent'] as String,
      noticeStatus: PostStatus.values.byName(json['noticeStatus'] as String),
      noticeCreatedAt: json['noticeCreatedAt'] != null
          ? DateTime.parse(json['noticeCreatedAt'] as String)
          : null,
      noticeUpdatedAt: json['noticeUpdatedAt'] != null
          ? DateTime.parse(json['noticeUpdatedAt'] as String)
          : null,
      noticeDeletedAt: json['noticeDeletedAt'] != null
          ? DateTime.parse(json['noticeDeletedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'noticeId': noticeId,
      'noticeTitle': noticeTitle,
      'noticeContent': noticeContent,
      'noticeStatus': noticeStatus.name,
      'noticeCreatedAt': noticeCreatedAt?.toIso8601String(),
      'noticeUpdatedAt': noticeUpdatedAt?.toIso8601String(),
      'noticeDeletedAt': noticeDeletedAt?.toIso8601String(),
    };
  }
}
