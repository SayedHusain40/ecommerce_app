import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_filter_chips.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductScreen extends StatefulWidget {
  final String? category;
  final int selectedIndex;

  const ProductScreen({super.key, this.category, required this.selectedIndex});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    // final String appBarTitle = widget.category ?? 'Products';
    return Scaffold(
      appBar: AppCustomAppBar(
        title: 'Categories',
        actions: [
          // SearchIconButton(),
          SizedBox(width: 12),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppIcons.setting(brightness)),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: .symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CategoryFilterChips(
              selectedIndex: widget.selectedIndex,
              autoScrollToSelected: true,
            ),

            SizedBox(height: 5),
            Text('Products', style: AppTextStyles.headingH3Regular),
            SizedBox(height: 10),
            Expanded(child: ProductsGridView<CategoryProductsCubit>()),
          ],
        ),
      ),
    );
  }
}
