import 'package:ecommerce_app/core/constants/app_images.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppCustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
    this.centerTitle = false,
    this.bottom,
  });

  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return AppBar(
      title: Text(title, style: AppTextStyles.body2Medium),
      centerTitle: centerTitle,
      titleSpacing: 0,
      actionsPadding: .symmetric(vertical: 17.5, horizontal: 16),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.grey50(brightness)),
      ),
      leading: IconButton(
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        icon: SvgPicture.asset(AppImages.arrowLeft(brightness)),
      ),
    );
  }
}
