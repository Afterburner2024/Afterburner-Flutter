import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class WriteDeadlinePicker extends StatelessWidget {
  final DateTime? deadline;
  final void Function(DateTime) onDatePicked;

  const WriteDeadlinePicker({
    super.key,
    required this.deadline,
    required this.onDatePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('모집 마감일', style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.mainTextPrimary, fontSize: 15)),
        Spacer(),
        TextButton.icon(
          icon: Icon(Icons.event, color: AppTheme.mainPrimary, size: 22),
          label: Text(
            deadline != null
                ? '${deadline!.year}.${deadline!.month.toString().padLeft(2, '0')}.${deadline!.day.toString().padLeft(2, '0')}'
                : '날짜 선택',
            style: TextStyle(
                color: AppTheme.mainPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          onPressed: () async {
            DateTime now = DateTime.now();
            DateTime initialDate = deadline ?? now.add(Duration(days: 7));
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: now,
              lastDate: now.add(Duration(days: 180)),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    dialogBackgroundColor: AppTheme.mainCard,
                    // ... (나머지 스타일 그대로)
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) onDatePicked(picked);
          },
        ),
      ],
    );
  }
}
