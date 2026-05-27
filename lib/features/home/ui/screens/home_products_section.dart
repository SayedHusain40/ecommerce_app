import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Latest Products', style: AppTextStyles.headingH3Bold),
            GestureDetector(
              onTap: () {
                context.pushNamed(RouteNames.productScreen);
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

        SizedBox(height: 12),

        Expanded(child: ProductsGridView()),
      ],
    );
  }
}
