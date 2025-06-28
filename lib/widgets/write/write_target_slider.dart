import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class WriteTargetSlider extends StatelessWidget {
  final int value;
  final void Function(double) onChanged;

  const WriteTargetSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('모집 인원', style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.mainTextPrimary, fontSize: 15)),
        const SizedBox(width: 14),
        Expanded(
          child: Slider(
            value: value.toDouble(),
            min: 2,
            max: 20,
            divisions: 18,
            label: '$value명',
            onChanged: onChanged,
            activeColor: AppTheme.mainPrimary,
            inactiveColor: AppTheme.mainLavender,
          ),
        ),
        Text('$value명', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.mainPrimary)),
      ],
    );
  }
}
