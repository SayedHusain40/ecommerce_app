import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_state.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_grid.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_list_view.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewListOrGird extends StatelessWidget {
  final bool isGrid;
  const CategoryViewListOrGird({super.key, required this.isGrid});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listenWhen: (previous, current) => current is GetCategoryFailure,
      listener: (context, state) {
        state.whenOrNull(
          getCategoryFailure: (appFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Failed to get Category')));
          },
        );
      },
      buildWhen: (previous, current) =>
          current is GetCategoryLoading ||
          current is GetCategorySuccess ||
          current is GetCategoryFailure,
      builder: (context, state) {
        return state.maybeWhen(
          getCategoryLoading: () => CategoryLoadingShimmer(isGrid: isGrid,),
          getCategorySuccess: (categoriesList) {
            if (isGrid) {
              return CategoryGrid(
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  final category = categoriesList[index];
                  return CategoryCard(
                    name: category.name!,
                    borderRadius: 16,
                    iconSize: 23,
                    textStyle: AppTextStyles.body3SemiBold,
                  );
                },
              );
            }
            return CategoryListView(
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                final category = categoriesList[index];
                return CategoryCard(
                  name: category.name!,
                  width: 76,
                  borderRadius: 12,
                  iconSize: 18,
                  textStyle: AppTextStyles.body4SemiBold,
                );
              },
            );
          },

          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
