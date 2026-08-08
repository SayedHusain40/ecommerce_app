import 'package:ecommerce_app/features/home/ui/widgets/see_all_button.dart';
import 'package:flutter/material.dart';

class SeeAllSection extends StatelessWidget {
  final VoidCallback onTap;

  const SeeAllSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SeeAllButton(onTap: onTap);
  }
}
