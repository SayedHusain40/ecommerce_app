import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    final isDark = context.isDark;

    return ChoiceChip(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
      onSelected: onSelected,
      backgroundColor: Colors.transparent,
      selectedColor: isDark
          ? const Color.fromARGB(40, 225, 229, 248)
          : const Color.fromARGB(33, 33, 35, 34),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      side: BorderSide(color: AppColors.grey150(brightness)),
      showCheckmark: false,
      avatar: SvgPicture.asset(AppIcons.activeCategory),
      elevation: 0,
      pressElevation: 0,
      selected: isActive,
      label: Text(label, style: AppTextStyles.body3SemiBold),
    );
  }
}
