import 'package:flutter/material.dart';
import '../../theme/side_app_theme.dart';

class PostCategoryBar extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  const PostCategoryBar({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: categories.map((cat) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ChoiceChip(
                label: Text(
                  cat,
                  style: TextStyle(
                    color: selectedCategory == cat
                        ? Colors.white
                        : AppTheme.mainTextSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                selected: selectedCategory == cat,
                selectedColor: AppTheme.mainPrimary,
                backgroundColor: AppTheme.mainBackground,
                elevation: selectedCategory == cat ? 3 : 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                side: BorderSide(
                  color: selectedCategory == cat
                      ? AppTheme.mainPrimary
                      : AppTheme.mainDivider,
                  width: 1.2,
                ),
                onSelected: (_) => onCategoryChanged(cat),
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
