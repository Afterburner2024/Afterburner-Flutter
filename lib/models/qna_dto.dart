import 'post_status.dart';

class QnaDTO {
  final int? qnaId;
  final String qnaTitle;
  final String qnaContent;
  final String? qnaAnswer;
  final PostStatus qnaStatus;
  final DateTime? qnaCreatedAt;
  final DateTime? qnaUpdatedAt;
  final DateTime? qnaDeletedAt;

  QnaDTO({
    this.qnaId,
    required this.qnaTitle,
    required this.qnaContent,
    this.qnaAnswer,
    required this.qnaStatus,
    this.qnaCreatedAt,
    this.qnaUpdatedAt,
    this.qnaDeletedAt,
  });

  factory QnaDTO.fromJson(Map<String, dynamic> json) {
    return QnaDTO(
      qnaId: json['qnaId'] as int?,
      qnaTitle: json['qnaTitle'] as String,
      qnaContent: json['qnaContent'] as String,
      qnaAnswer: json['qnaAnswer'] as String?,
      qnaStatus: PostStatus.values.byName(json['qnaStatus'] as String),
      qnaCreatedAt: json['qnaCreatedAt'] != null
          ? DateTime.parse(json['qnaCreatedAt'] as String)
          : null,
      qnaUpdatedAt: json['qnaUpdatedAt'] != null
          ? DateTime.parse(json['qnaUpdatedAt'] as String)
          : null,
      qnaDeletedAt: json['qnaDeletedAt'] != null
          ? DateTime.parse(json['qnaDeletedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qnaId': qnaId,
      'qnaTitle': qnaTitle,
      'qnaContent': qnaContent,
      'qnaAnswer': qnaAnswer,
      'qnaStatus': qnaStatus.name,
      'qnaCreatedAt': qnaCreatedAt?.toIso8601String(),
      'qnaUpdatedAt': qnaUpdatedAt?.toIso8601String(),
      'qnaDeletedAt': qnaDeletedAt?.toIso8601String(),
    };
  }
}
