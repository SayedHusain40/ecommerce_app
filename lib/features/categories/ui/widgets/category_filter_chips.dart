import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_consumer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/home_style_category_chip.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/horizontal_list_view.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/product_style_category_chip.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFilterChips extends StatefulWidget {
  final bool isSliver;
  final int? productsLimit;
  final int selectedIndex;
  final bool isHomeStyleChip;
  final void Function({required int index, String? name})? onSelectedCategory;
  const CategoryFilterChips({
    super.key,
    this.isSliver = false,
    this.productsLimit,
    this.selectedIndex = 0,
    this.isHomeStyleChip = true,
    this.onSelectedCategory,
  });

  @override
  State<CategoryFilterChips> createState() => _CategoryFilterChipsState();
}

class _CategoryFilterChipsState extends State<CategoryFilterChips> {
  late int selectedCategoryIndex = widget.selectedIndex;
  bool _isFirstLoad = true;

  final Map<int, GlobalKey> _chipKeyMap = {};

  // putIfAbsent => 2 in 1 : store GlobalKey and return GlobalKey
  // notes: putIfAbsent expects a function (not a value) as 2nd argument
  // putIfAbsent : if index already has a GlobalKey → return the existing one
  // if not → create new one, store it, and return it

  GlobalKey _storeKey(int index) =>
      _chipKeyMap.putIfAbsent(index, () => GlobalKey());

  void _scrollToSelectedIfNeeded() {
    final key = _chipKeyMap[selectedCategoryIndex];
    final ctx = key?.currentContext;
    if (ctx == null) return;

    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      alignment: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryProductsCubit = context.read<CategoryProductsCubit>();

    return CategoryConsumer(
      isSliver: widget.isSliver,
      onLoading: (context) => HorizontalListView(
        itemCount: context.responsive(mobile: 6, tablet: 8, desktop: 10),
        isSliver: widget.isSliver,
        itemBuilder: (_, _) =>
            const CategoryCardShimmer(width: 76, borderRadius: 8),
      ),
      onSuccess: (context, categories) {
        if (_isFirstLoad && selectedCategoryIndex != 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToSelectedIfNeeded();
          });
        }
        _isFirstLoad = false;

        return HorizontalListView(
          isSliver: widget.isSliver,
          itemCount: categories.length + 1,
          space: widget.isHomeStyleChip ? 3 : 10,
          // height: widget.isHomeStyleChip? 60 : 90,
          itemBuilder: (context, index) {
            final isAllSection = index == 0;
            final category = isAllSection ? null : categories[index - 1];
            final isActive = selectedCategoryIndex == index;
            final label = isAllSection ? 'All' : category!.name!;

            void handleSelect(bool _) {
              widget.onSelectedCategory?.call(
                index: index,
                name: category?.name,
              );
              setState(() => selectedCategoryIndex = index);

              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollToSelectedIfNeeded();
              });

              if (isAllSection) {
                categoryProductsCubit.getProducts(limit: widget.productsLimit);
              } else {
                categoryProductsCubit.getProductsByCategory(
                  categoryName: category!.name!,
                  limit: widget.productsLimit,
                );
              }
            }

            return Container(
              key: _storeKey(index),
              child: widget.isHomeStyleChip
                  ? HomeStyleCategoryChip(
                      label: label,
                      isActive: isActive,
                      isAllSection: isAllSection,
                      onSelected: handleSelect,
                    )
                  : ProductStyleCategoryChip(
                      label: label,
                      isActive: isActive,
                      onSelected: handleSelect,
                    ),
            );
          },
        );
      },
    );
  }
}
