import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/search_icon_button.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_filter_chips.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
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
  @override
  void initState() {
    final categoryProductsCubit = context.read<CategoryProductsCubit>();

    if (widget.category != null) {
      categoryProductsCubit.getProductsByCategory(category: widget.category!);
    }
    categoryProductsCubit.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppCustomAppBar(
        title: 'Products',
        showBackButton: false,
        actions: [
          const SearchIconButton(),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppIcons.setting(brightness)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const .symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CategoryFilterChips(selectedIndex: widget.selectedCategoryIndex),

            const SizedBox(height: 5),
            Text('Products', style: AppTextStyles.headingH3Regular),
            const SizedBox(height: 10),
            const Expanded(child: ProductsGridView<CategoryProductsCubit>()),
          ],
        ),
      ),
    );
  }
}
