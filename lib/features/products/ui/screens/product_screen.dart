import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/search_icon_button.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_filter_chips.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/filter_content_bottom_sheet.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductScreen extends StatefulWidget {
  final String? category;
  final int selectedCategoryIndex;

  const ProductScreen({
    super.key,
    this.category,
    required this.selectedCategoryIndex,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isGridView = true;

  @override
  void initState() {
    final categoryProductsCubit = context.read<CategoryProductsCubit>();

    if (widget.category != null) {
      categoryProductsCubit.getProductsByCategory(
        categoryName: widget.category!,
      );
    } else {
      categoryProductsCubit.getProducts();
    }
    super.initState();
  }

  void onSelectFilter() {
    final categoryProductsCubit = context.read<CategoryProductsCubit>();

    showModalBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: categoryProductsCubit,
          child: const FilterContentBottomSheet(),
        );
      },
    );
  }

  void toggleView(bool gridView) {
    if (isGridView == gridView) return;
    setState(() => isGridView = gridView);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final l10n = context.l10n;

    return AppScaffold(
      verticalPadding: 12,
      appBar: AppCustomAppBar(
        title: l10n.products,
        showBackButton: false,
        actions: [
          const SearchIconButton(),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onSelectFilter,
            child: SvgPicture.asset(AppIcons.setting(brightness)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryFilterChips(
            selectedIndex: widget.selectedCategoryIndex,
            isHomeStyleChip: false,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.products, style: AppTextStyles.headingH3Regular),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => toggleView(true),
                    child: design(
                      isActive: isGridView,
                      icon: Icons.grid_view_rounded,
                      brightness: brightness,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => toggleView(false),
                    child: design(
                      isActive: !isGridView,
                      icon: Icons.list_rounded,
                      brightness: brightness,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          if (isGridView)
            const Expanded(child: ProductsGridView<CategoryProductsCubit>())
          else
            const Expanded(child: ProductsListView()),
        ],
      ),
    );
  }
}

Widget design({
  required bool isActive,
  required IconData icon,
  required Brightness brightness,
}) {
  return Container(
    width: 28,
    height: 28,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isActive ? AppColors.whiteInDark(brightness) : Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      border: isActive
          ? null
          : Border.all(color: AppColors.grey150(brightness)),
    ),
    child: Icon(
      icon,
      size: 16,
      color: isActive
          ? AppColors.blackInDark(
              brightness,
            ) // or whichever "active" accent you use
          : AppColors.grey150(brightness),
    ),
  );
}
