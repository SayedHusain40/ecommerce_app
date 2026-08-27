import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class RequiredLabel extends StatelessWidget {
  const RequiredLabel(this.label, {super.key, this.isRequired = true});

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;

    if (!isRequired) {
      return Text(
        label,
        style: AppTextStyles.body2Medium.copyWith(
          color: AppColors.whiteInDark(brightness),
        ),
      );
    }

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
