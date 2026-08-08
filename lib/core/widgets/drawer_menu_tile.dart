import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/settings_arrow_icon.dart';
import 'package:flutter/material.dart';

class DrawerMenuTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const DrawerMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          minTileHeight: 64,
          leading: SizedBox(width: 24, height: 24, child: icon),
          title: Text(title, style: AppTextStyles.body2Medium),
          trailing: trailing ?? const SettingsArrowIcon(width: 15, height: 15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(height: 1, color: AppColors.grey50(brightness)),
        ),
      ],
    );
  }
}