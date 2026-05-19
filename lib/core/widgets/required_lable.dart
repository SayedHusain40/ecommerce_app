import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class RequiredLabel extends StatelessWidget {
  const RequiredLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.whiteInDark(brightness),
            ),
          ),
          TextSpan(
            text: ' *',
            style: AppTextStyles.body2Medium.copyWith(color: AppColors.red),
          ),
        ],
      ),
    );
  }
}
