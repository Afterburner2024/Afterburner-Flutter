import 'package:flutter/material.dart';

class StudyPost {
  final int id;                       // 게시글 고유번호
  final String title;                 // 스터디 제목
  final String summary;               // 한줄 요약/설명
  final String detail;                // 상세 설명
  final String category;              // 카테고리 (예: 프론트엔드/AI/기타)
  final int currentMembers;           // 현재 참여 인원
  final int targetMembers;            // 목표 인원
  final bool isClosed;                // 마감 여부
  final DateTime deadline;            // 마감일
  final List<String> roles;           // 모집 역할(예: 프론트엔드, 디자이너 등)
  final List<String> members;         // 참여 멤버(닉네임 등)
  // 필요시: 썸네일, 태그 등 추가

  StudyPost({
    required this.id,
    required this.title,
    required this.summary,
    required this.detail,
    required this.category,
    required this.currentMembers,
    required this.targetMembers,
    required this.isClosed,
    required this.deadline,
    required this.roles,
    required this.members,
  });

  // 예시: JSON 파싱 메서드 (Firestore 연동 대비)
  factory StudyPost.fromJson(Map<String, dynamic> json) {
    return StudyPost(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      detail: json['detail'],
      category: json['category'],
      currentMembers: json['currentMembers'],
      targetMembers: json['targetMembers'],
      isClosed: json['isClosed'],
      deadline: DateTime.parse(json['deadline']),
      roles: List<String>.from(json['roles'] ?? []),
      members: List<String>.from(json['members'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'detail': detail,
      'category': category,
      'currentMembers': currentMembers,
      'targetMembers': targetMembers,
      'isClosed': isClosed,
      'deadline': deadline.toIso8601String(),
      'roles': roles,
      'members': members,
    };
  }
}

final List<StudyPost> sampleStudyPosts = [
  StudyPost(
    id: 1,
    title: "AI 논문 스터디",
    summary: "매주 AI 논문을 읽고 토론합니다.",
    detail: "AI에 관심 있는 분들과 함께 논문을 읽고 발표합니다.",
    category: "AI",
    currentMembers: 5,
    targetMembers: 8,
    isClosed: false,
    deadline: DateTime(2025, 8, 1),
    roles: ["발표자", "정리자"],
    members: ["철수", "영희", "민수", "승연", "나래"],
  ),
  StudyPost(
    id: 2,
    title: "프론트엔드 스터디",
    summary: "React로 토이 프로젝트를 만듭니다.",
    detail: "React, TypeScript에 관심 있는 분 환영!",
    category: "프론트엔드",
    currentMembers: 3,
    targetMembers: 5,
    isClosed: false,
    deadline: DateTime(2025, 7, 20),
    roles: ["리더", "코더"],
    members: ["진호", "슬기", "민준"],
  ),
  // ... 추가로 원하는 만큼 더 작성
];
