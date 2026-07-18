import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String label;
  const CustomTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 20,
            endIndent: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(label, style: AppTextStyles.headingH3Bold),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 10,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}