import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BoardCard extends StatelessWidget {
  final String title;
  final String description;
  final String? imageUrl;       // 썸네일 이미지 (optional)
  final IconData? icon;         // 대표 아이콘 (optional)
  final String? date;           // 날짜 (optional)

  const BoardCard({
    required this.title,
    required this.description,
    this.imageUrl,
    this.icon,
    this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일 이미지 or 아이콘
            if (imageUrl != null && imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              )
            else if (icon != null)
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: kAccent.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 32, color: kAccent),
              ),
            if (imageUrl != null || icon != null) const SizedBox(width: 16),

            // 텍스트 영역
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목/날짜
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: kPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (date != null && date!.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Text(
                          date!,
                          style: const TextStyle(
                            color: kTextSub,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: kTextSub,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
