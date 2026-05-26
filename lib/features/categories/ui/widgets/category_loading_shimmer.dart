import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:flutter/material.dart';

class CategoryLoadingShimmer extends StatelessWidget {
  final bool isGrid;

  const CategoryLoadingShimmer({super.key, this.isGrid = false});

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      return GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
          mainAxisSpacing: 10,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (_, __) => CategoryCardShimmer(borderRadius: 16),
      );
    }

    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, __) => CategoryCardShimmer(width: 76, borderRadius: 8),
      ),
    );
  }
}
