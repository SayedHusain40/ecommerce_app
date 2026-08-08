import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductStyleCategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final ValueChanged<bool> onSelected;

  const ProductStyleCategoryChip({
    super.key,
    required this.label,
    required this.isActive,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final isDark = context.isRtl;

    return ChoiceChip(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
      onSelected: onSelected,
      backgroundColor: isDark
          ? AppColors.cyan50Dark
          : const Color.fromARGB(255, 246, 244, 244),
      selectedColor: isDark
          ? const Color.fromARGB(255, 76, 77, 77)
          : const Color.fromARGB(164, 193, 210, 219),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      side: const BorderSide(color: Colors.grey),
      showCheckmark: false,
      avatar: const Icon(Icons.category, color: AppColors.cyan),
      elevation: 0,
      pressElevation: 0,
      label: Text(label, style: AppTextStyles.body3SemiBold),
      selected: isActive,
    );
  }
}
