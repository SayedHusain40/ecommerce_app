import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      width: 96,
      height: 32,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: .circular(8),
        border: BoxBorder.all(width: 1, color: AppColors.grey50(brightness)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.minus(brightness)),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '0',
                style: AppTextStyles.body1Medium.copyWith(height: 0.0),
              ),
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () {},
              child: Ink(
                child: SvgPicture.asset(
                  AppIcons.add(brightness),
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
