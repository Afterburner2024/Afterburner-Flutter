import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class WriteRoleSelector extends StatelessWidget {
  final List<String> roles;
  final String? selectedRole;
  final void Function(String?) onChanged;
  final Future<void> Function() onAddRole;

  const WriteRoleSelector({
    super.key,
    required this.roles,
    required this.selectedRole,
    required this.onChanged,
    required this.onAddRole,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('모집 역할 선택', style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.mainTextPrimary, fontSize: 17)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedRole,
                hint: Text('역할 선택 또는 직접 입력'),
                items: roles.map((role) => DropdownMenuItem(
                  value: role,
                  child: Text(role),
                )).toList(),
                onChanged: onChanged,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? '모집 역할을 선택하세요' : null,
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.add, color: AppTheme.mainPrimary),
              tooltip: "직접 입력",
              onPressed: onAddRole,
            ),
          ],
        ),
      ],
    );
  }
}
