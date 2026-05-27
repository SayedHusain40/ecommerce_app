import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_grid.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_list_view.dart';
import 'package:flutter/material.dart';

class CategoryLoadingShimmer extends StatelessWidget {
  final bool isGrid;

  const CategoryLoadingShimmer({super.key, required this.isGrid});

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      return CategoryGrid(
        itemCount: 6,
        itemBuilder: (_, _) {
          return CategoryCardShimmer(borderRadius: 16);
        },
      );
    }

    return SizedBox(
      height: 60,
      child: CategoryListView(
        itemBuilder: (_, _) => CategoryCardShimmer(width: 76, borderRadius: 8),
      ),
    );
  }
}
