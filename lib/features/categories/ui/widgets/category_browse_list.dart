import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/data/model/category_model.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_consumer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_grid.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_list_view.dart';
import 'package:flutter/material.dart';

class CategoryBrowseList extends StatelessWidget {
  final bool isGrid;
  final bool isSliver;

  const CategoryBrowseList({
    super.key,
    this.isGrid = false,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    return CategoryConsumer(
      onLoading: (context) => isGrid
          ? CategoryGrid(
              itemCount: 6,
              itemBuilder: (_, _) =>
                  const CategoryCardShimmer(borderRadius: 16),
            )
          : CategoryListView(
              isSliver: isSliver,
              itemBuilder: (_, _) =>
                  const CategoryCardShimmer(width: 76, borderRadius: 8),
            ),
      onSuccess: (context, categories) {
        Widget cardFor(CategoryModel category, int index) => CategoryCard(
          name: category.name!,
          borderRadius: isGrid ? 16 : 12,
          iconSize: isGrid ? 23 : 20,
          width: isGrid ? null : 76,
          textStyle: isGrid
              ? AppTextStyles.body3SemiBold
              : AppTextStyles.body4SemiBold,
          onTap: () => context.pushNamed(
            RouteNames.productScreen,
            arguments: {
              'categoryName': category.name,
              'selectedIndex': index + 1,
            },
          ),
        );

        if (isGrid) {
          return CategoryGrid(
            itemCount: categories.length,
            itemBuilder: (context, index) => cardFor(categories[index], index),
          );
        }
        return CategoryListView(
          isSliver: isSliver,
          itemCount: categories.length,
          space: 8,
          itemBuilder: (context, index) => cardFor(categories[index], index),
        );
      },
    );
  }
}
