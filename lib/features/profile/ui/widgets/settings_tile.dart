import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/settings_arrow_icon.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingsTile({
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
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, weight: 24, color: AppColors.grey150Light),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.body2Medium.copyWith(
                        color: AppColors.grey150(brightness),
                      ),
                    ),
                  ),
                  trailing ?? const SettingsArrowIcon(),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1, thickness: 1, color: AppColors.grey50(brightness)),
      ],
    );
  }
}
