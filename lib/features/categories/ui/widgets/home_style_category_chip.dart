import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeStyleCategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool isAllSection;
  final ValueChanged<bool> onSelected;

  const HomeStyleCategoryChip({
    super.key,
    required this.label,
    required this.isActive,
    required this.isAllSection,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    return ChoiceChip(
      onSelected: onSelected,
      backgroundColor: AppColors.blackInDark(brightness),
      selectedColor: AppColors.blackInDark(brightness),
      shape: isAllSection
          ? const CircleBorder()
          : const StadiumBorder(side: BorderSide()),
      side: isActive
          ? BorderSide(color: AppColors.whiteInDark(brightness))
          : BorderSide.none,
      showCheckmark: false,
      elevation: 0,
      pressElevation: 0,
      label: Text(label, style: AppTextStyles.body3SemiBold),
      selected: isActive,
    );
  }
}
