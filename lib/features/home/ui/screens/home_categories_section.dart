import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/categories_view.dart';
import 'package:flutter/material.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('Categories', style: AppTextStyles.headingH3Bold),
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

        SizedBox(height: 12),

        CategoriesView(isGrid: false),
      ],
    );
  }
}
