import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final double? width;
  final double borderRadius;
  final double iconSize;
  final TextStyle textStyle;

  const CategoryCard({
    super.key,
    required this.name,
    this.width,
    required this.borderRadius,
    required this.iconSize,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: BoxBorder.all(color: AppColors.grey50(brightness)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category, size: iconSize, color: AppColors.cyan),
          const SizedBox(height: 2),
          Text(
            name,
            style: textStyle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
