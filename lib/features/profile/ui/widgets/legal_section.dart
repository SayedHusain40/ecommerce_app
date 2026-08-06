import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class LegalPoint {
  final String point;
  const LegalPoint({required this.point});
}


class LegalSection extends StatelessWidget {
  final String number;
  final String title;
  final List<LegalPoint> points;

  const LegalSection({
    super.key,
    required this.number,
    required this.title,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$number. ',
                style: AppTextStyles.body2Medium.copyWith(
                  color: AppColors.whiteInDark(brightness),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.body2Medium.copyWith(
                    color: AppColors.whiteInDark(brightness),
                  ),
                ),
              ),
            ],
          ),
          ...points.map((e) {
            return Text(
              '   - ${e.point}',
              style: AppTextStyles.body2Medium.copyWith(
                color: AppColors.grey150(brightness),
              ),
            );
          }),
        ],
      ),
    );
  }
}