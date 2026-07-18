import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  final VoidCallback onTap;

  const SeeAllButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('See All', style: TextStyle(color: AppColors.grey150Light)),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward, size: 15, color: AppColors.grey150Light),
          ],
        ),
      ),
    );
  }
}