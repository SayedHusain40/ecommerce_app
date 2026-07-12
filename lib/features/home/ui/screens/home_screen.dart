import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/categories_view.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_banner.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        // actions: [SearchIconButton(), SizedBox(width: 15)],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            CategoriesView(isGrid: false, isSliver: true, isNormal: true),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  HomeBanner(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CustomTitle(label: 'Latest Products'),
                  SizedBox(height: 12),
                ],
              ),
            ),

            ProductsGridView<LatestProductsCubit>(isSilver: true),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(RouteNames.categoryScreen);
                      },
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(color: AppColors.grey150Light),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: AppColors.grey150Light,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  CustomTitle(label: 'Categories'),
                  SizedBox(height: 12),
                ],
              ),
            ),
            CategoriesView(isGrid: false, isSliver: true),
            ProductsGridView<CategoryProductsCubit>(isSilver: true),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(color: AppColors.grey150Light),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: AppColors.grey150Light,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  final String label;
  const CustomTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 20,
            endIndent: 10,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(label, style: AppTextStyles.headingH3Bold),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 10,
            endIndent: 20,
          ),
        ),
      ],//*
    );
    
     }
}
