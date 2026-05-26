import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_state.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(title: 'Categories'),
      body: Padding(
        padding: .symmetric(vertical: 12, horizontal: 16),
        child: BlocConsumer<CategoryCubit, CategoryState>(
          listenWhen: (previous, current) => current is GetCategoryFailure,
          listener: (context, state) {
            state.whenOrNull(
              getCategoryFailure: (appFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(appFailure.message)));
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              getCategoryFailure: (appFailure) => Text('There is error'),
              getCategoryLoading: () => CategoryLoadingShimmer(isGrid: true),
              getCategorySuccess: (categoriesList) {
                return GridView.builder(
                  itemCount: categoriesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 100,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
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
              },
              orElse: () => Text('Something happen wrong'),
            );
          },
        ),
      ),
    );
  }
}
