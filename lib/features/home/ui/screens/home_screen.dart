import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_drawer.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/search_icon_button.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_browse_list.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_filter_chips.dart';
import 'package:ecommerce_app/features/home/ui/widgets/custom_title.dart';
import 'package:ecommerce_app/features/home/ui/widgets/home_banner.dart';
import 'package:ecommerce_app/features/home/ui/widgets/see_all_section.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/latest_products_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';
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
    final l10n = context.l10n;

    return AppScaffold(
      verticalPadding: 12,
      appBar: const AppCustomAppBar(
        logo: true,
        centerTitle: true,
        showBackButton: false,
        actions: [SearchIconButton()],
      ),
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          // Browse categories
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      l10n.browseCategories,
                      style: AppTextStyles.body2Regular,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(RouteNames.categoryScreen);
                      },
                      child: Text(
                        l10n.seeAll,
                        style: AppTextStyles.body3SemiBold.copyWith(
                          color: AppColors.cyan,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                CustomTitle(label: l10n.latestProducts),
                const SizedBox(height: 12),
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
                SeeAllSection(
                  onTap: () => navCubit.selectCategory(
                    categoryIndex: 0,
                    categoryName: null,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTitle(label: l10n.categories),
                const SizedBox(height: 12),
              ],
            ),
          ),

          // Category filter chips
          CategoryFilterChips(
            isSliver: true,
            productsLimit: context.responsive(
              mobile: 4,
              tablet: 8,
              desktop: 10,
            ),
            onSelectedCategory: onSelectedCategory,
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // Filtered products grid
          const ProductsGridView<CategoryProductsCubit>(isSilver: true),

          // See All (bottom)
          SliverToBoxAdapter(
            child: Column(
              children: [
                SeeAllSection(
                  onTap: () => navCubit.selectCategory(
                    categoryIndex: _categoryIndex,
                    categoryName: _categoryName,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
