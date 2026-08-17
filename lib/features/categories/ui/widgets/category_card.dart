import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final double? width;
  final double borderRadius;
  final double iconWidth;
  final double? iconHight;
  final TextStyle textStyle;
  final Function()? onTap;

  const CategoryCard({
    super.key,
    required this.name,
    this.width,
    required this.borderRadius,
    required this.iconWidth,
    this.iconHight,
    required this.textStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final isDark = context.isDark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cyan50Dark : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: BoxBorder.all(color: AppColors.grey50(brightness)),
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            SizedBox(
              width: iconWidth,
              height: iconHight,
              child: SvgPicture.asset(AppIcons.activeCategory),
            ),
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
      ),
    );
  }
}
