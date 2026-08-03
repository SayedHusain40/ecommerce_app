import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/search_icon_button.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_browse_list.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_filter_chips.dart';
import 'package:ecommerce_app/features/home/ui/widgets/custom_title.dart';
import 'package:ecommerce_app/features/home/ui/widgets/home_banner.dart';
import 'package:ecommerce_app/features/home/ui/widgets/see_all_button.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/latest_products_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final NavCubit navCubit;

  // this for help get category index for help do "See All"
  int _categoryIndex = 0;
  String? _categoryName;

  void onSelectedCategory({required int index, String? name}) {
    _categoryIndex = index;
    _categoryName = name;
  }

  @override
  void initState() {
    super.initState();

    navCubit = context.read<NavCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [SearchIconButton(), SizedBox(width: 15)],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            // Browse categories
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Browse Categories',
                        style: AppTextStyles.body3SemiBold,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RouteNames.categoryScreen);
                        },
                        child: Text(
                          'SEE ALL',
                          style: AppTextStyles.body3SemiBold.copyWith(
                            color: AppColors.cyan,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const CategoryBrowseList(isSliver: true),

            // Banner
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  HomeBanner(),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Latest Products title
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CustomTitle(label: 'Latest Products'),
                  SizedBox(height: 12),
                ],
              ),
            ),

            // Latest products grid
            const ProductsGridView<LatestProductsCubit>(isSilver: true),

            // See All + Categories title
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SeeAllButton(
                    onTap: () {
                      navCubit.selectCategory(
                        categoryIndex: 0,
                        categoryName: null,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const CustomTitle(label: 'Categories'),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // Category filter chips
            CategoryFilterChips(
              isSliver: true,
              productsLimit: 4,
              onSelectedCategory: onSelectedCategory,
            ),

            // Filtered products grid
            const ProductsGridView<CategoryProductsCubit>(isSilver: true),

            // See All (bottom)
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SeeAllButton(
                    onTap: () {
                      navCubit.selectCategory(
                        categoryIndex: _categoryIndex,
                        categoryName: _categoryName,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
