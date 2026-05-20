import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/home/logic/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home/logic/cubit/home_state.dart';
import 'package:ecommerce_app/features/home/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestProductsSection extends StatelessWidget {
  const LatestProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Latest Products', style: AppTextStyles.headingH3Bold),
            GestureDetector(
              onTap: () {},
              child: Text(
                'SEE ALL',
                style: AppTextStyles.body3SemiBold.copyWith(
                  color: AppColors.cyan,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        BlocConsumer<HomeCubit, HomeState>(
          listenWhen: (previous, current) => current is GetProductFailure,
          listener: (context, state) {
            state.whenOrNull(
              getProductFailure: (appFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to get Products')),
                );
              },
            );
          },
          buildWhen: (previous, current) =>
              current is GetProductLoading ||
              current is GetProductSuccess ||
              current is GetProductFailure,
          builder: (context, state) {
            return state.maybeWhen(
              getProductLoading: () => SizedBox(),
              getProductSuccess: (productsList) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: productsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: productsList[index]);
                    },
                  ),
                );
              },
              orElse: () => SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
