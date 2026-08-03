import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.whiteInDark(brightness),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: AppTextStyles.body2Regular.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
        ],
      ),
    );
  }
}
