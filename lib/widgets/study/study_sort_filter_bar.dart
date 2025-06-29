import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class StudySortFilterBar extends StatelessWidget {
  final List<String> sortOptions;
  final String selectedSort;
  final Function(String?) onSortChanged;
  final VoidCallback onShowSchedule;

  const StudySortFilterBar({
    super.key,
    required this.sortOptions,
    required this.selectedSort,
    required this.onSortChanged,
    required this.onShowSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: AppTheme.mainCard,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.mainShadow,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(color: AppTheme.mainDivider, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedSort,
                icon: Icon(Icons.keyboard_arrow_down, color: AppTheme.mainPrimary, size: 26),
                style: TextStyle(
                  color: AppTheme.mainTextPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                dropdownColor: AppTheme.mainCard,
                borderRadius: BorderRadius.circular(12),
                onChanged: onSortChanged,
                items: sortOptions.map((option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                )).toList(),
              ),
            ),
          ),
          Spacer(),
          TextButton.icon(
            icon: Icon(Icons.event, color: AppTheme.mainPrimary),
            label: Text("스터디 일정", style: TextStyle(color: AppTheme.mainPrimary)),
            onPressed: onShowSchedule,
          ),
        ],
      ),
    );
  }
}
