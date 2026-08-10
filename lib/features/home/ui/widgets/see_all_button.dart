import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  final VoidCallback onTap;

  const SeeAllButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.seeAllLabel,
              style: const TextStyle(color: AppColors.grey150Light),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.arrow_forward,
              size: 15,
              color: AppColors.grey150Light,
            ),
          ],
        ),
      ),
    );
  }
}
