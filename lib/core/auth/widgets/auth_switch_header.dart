import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthSwitchHeader extends StatelessWidget {
  const AuthSwitchHeader({
    super.key,
    required this.title,
    required this.promptText,
    required this.actionText,
    required this.onActionTap,
  });

  final String title;
  final String promptText;
  final String actionText;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.headingH2Bold),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: promptText,
                style: AppTextStyles.body2Regular.copyWith(
                  color: AppColors.grey150(brightness),
                ),
              ),
              TextSpan(
                text: actionText,
                style: AppTextStyles.body2Medium.copyWith(color: AppColors.cyan),
                recognizer: TapGestureRecognizer()..onTap = onActionTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}