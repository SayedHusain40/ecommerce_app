import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/data/model/category_model.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_consumer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_grid.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/horizontal_list_view.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          // on gird i don't used sliver
          ? CategoryGrid(
              itemCount: 6,
              itemBuilder: (_, _) =>
                  const CategoryCardShimmer(borderRadius: 16),
            )
          : HorizontalListView(
              itemCount: context.responsive(mobile: 6, tablet: 8, desktop: 10),
              isSliver: isSliver,
              itemBuilder: (_, _) =>
                  const CategoryCardShimmer(width: 76, borderRadius: 8),
            ),
      onSuccess: (context, categories) {
        Widget cardFor(CategoryModel category, int index) => CategoryCard(
          name: category.name!,
          borderRadius: isGrid ? 16 : 12,
          iconWidth: isGrid ? 23 : 20,
          width: isGrid
              ? null
              : context.responsive(mobile: 76, tablet: 96, desktop: 110),

          textStyle: isGrid
              ? AppTextStyles.body3SemiBold
              : AppTextStyles.body4SemiBold,
          onTap: () {
            context.read<NavCubit>().selectCategory(
              categoryIndex: index + 1,
              categoryName: category.name,
            );
            if (Navigator.of(context).canPop()) {
              Navigator.pop(context);
            }
          },
        );

        if (isGrid) {
          return CategoryGrid(
            itemCount: categories.length,
            itemBuilder: (context, index) => cardFor(categories[index], index),
          );
        }
        return HorizontalListView(
          isSliver: isSliver,
          itemCount: categories.length,
          space: 8,
          itemBuilder: (context, index) => cardFor(categories[index], index),
        );
      },
    );
  }
}
