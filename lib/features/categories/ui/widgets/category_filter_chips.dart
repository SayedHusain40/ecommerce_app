import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_consumer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/horizontal_list_view.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFilterChips extends StatefulWidget {
  final bool isSliver;
  final int? productsLimit;
  final int selectedIndex;
  final bool isHomeStyleChip;
  const CategoryFilterChips({
    super.key,
    this.isSliver = false,
    this.productsLimit,
    this.selectedIndex = 0,
    this.isHomeStyleChip = true,
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
    final brightness = Theme.of(context).brightness;
    final categoryProductsCubit = context.read<CategoryProductsCubit>();

    return CategoryConsumer(
      onLoading: (context) => HorizontalListView(
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
          itemBuilder: (context, index) {
            final isAllSection = index == 0;
            final category = isAllSection ? null : categories[index - 1];
            final isActive = selectedCategoryIndex == index;

            return Container(
              key: _storeKey(index),
              child: Theme(
                data: Theme.of(
                  context,
                ).copyWith(splashFactory: NoSplash.splashFactory),
                child: ChoiceChip(
                  onSelected: (_) {
                    setState(() => selectedCategoryIndex = index);

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToSelectedIfNeeded();
                    });

                    if (isAllSection) {
                      categoryProductsCubit.getProducts(
                        limit: widget.productsLimit,
                      );
                    } else {
                      categoryProductsCubit.getProductsByCategory(
                        categoryName: category!.name!,
                        limit: widget.productsLimit,
                      );
                    }
                  },
                  backgroundColor: AppColors.blackInDark(brightness),
                  selectedColor: AppColors.blackInDark(brightness),
                  shape: isAllSection
                      ? const CircleBorder()
                      : widget.isHomeStyleChip
                      ? const StadiumBorder(side: BorderSide())
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                  side: isActive || !widget.isHomeStyleChip
                      ? const BorderSide()
                      : BorderSide.none,
                  showCheckmark: false,
                  // avatar: !isAllSection && widget.style.withImage ? const Icon(Icons.category) : null,
                  elevation: 0,
                  pressElevation: 0,
                  label: Text(isAllSection ? 'All' : category!.name!),
                  selected: isActive,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
