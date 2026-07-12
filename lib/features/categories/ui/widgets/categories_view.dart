import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_state.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_grid.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_list_view.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatefulWidget {
  final bool isGrid;
  final bool isSliver;
  final bool isNormal;
  const CategoriesView({
    super.key,
    required this.isGrid,
    this.isSliver = false,
    this.isNormal = false,
  });

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final categoryProductsCubit = context.read<CategoryProductsCubit>();

    Widget sliverSafe(Widget child) =>
        widget.isSliver ? SliverToBoxAdapter(child: child) : child;

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
          getCategoryLoading: () => widget.isGrid
              ? CategoryGrid(
                  itemCount: 6,
                  itemBuilder: (_, _) =>
                      const CategoryCardShimmer(borderRadius: 16),
                )
              : CategoryListView(
                  isSliver: widget.isSliver,
                  itemBuilder: (_, _) =>
                      const CategoryCardShimmer(width: 76, borderRadius: 8),
                ),
          getCategorySuccess: (categoriesList) {
            if (widget.isGrid) {
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
            return widget.isNormal
                ? CategoryListView(
                    isSliver: widget.isSliver,
                    itemCount: categoriesList.length + 1,
                    space: 8,
                    itemBuilder: (context, index) {
                      final category = categoriesList[index];
                      return CategoryCard(
                        name: category.name!,
                        borderRadius: 12,
                        iconSize: 20,
                        width: 76,
                        textStyle: AppTextStyles.body4SemiBold,
                      );
                    },
                  )
                : CategoryListView(
                    isSliver: widget.isSliver,
                    itemCount: categoriesList.length + 1,
                    itemBuilder: (context, index) {
                      final isAllSection = index == 0;
                      final category = isAllSection
                          ? null
                          : categoriesList[index - 1];
                      final isActive = selectedIndex == index;

                      return Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(splashFactory: NoSplash.splashFactory),
                        child: ChoiceChip(
                          onSelected: (value) {
                            setState(() {
                              selectedIndex = index;
                            });

                            if (index == 0) {
                              categoryProductsCubit.getProducts(limit: 4);
                            } else {
                              categoryProductsCubit.getProductsByCategory(
                                category: category!.name!,
                                limit: 4,
                              );
                            }
                          },
                          backgroundColor: AppColors.blackInDark(brightness),
                          selectedColor: AppColors.blackInDark(brightness),
                          shape: index == 0
                              ? CircleBorder()
                              : StadiumBorder(side: BorderSide()),
                          side: isActive ? BorderSide() : BorderSide.none,
                          showCheckmark: false,
                          elevation: 0,
                          pressElevation: 0,
                          label: Text(isAllSection ? 'All' : category!.name!),
                          selected: isActive,
                        ),
                      );
                    },
                  );
          },
          orElse: () => sliverSafe(const SizedBox.shrink()),
        );
      },
    );
  }
}
