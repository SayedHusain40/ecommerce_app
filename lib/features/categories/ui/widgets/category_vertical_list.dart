import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card_shimmer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_consumer.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/vertical_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryVerticalList extends StatelessWidget {
  const CategoryVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return CategoryConsumer(
      onLoading: (context) => VerticalListView(
        itemCount: 6,
        itemBuilder: (_, _) => const CategoryCardShimmer(borderRadius: 16),
      ),

      onSuccess: (context, categories) {
        return VerticalListView(
          space: 0,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    context.pop();
                    context.read<NavCubit>().selectCategory(
                      categoryName: category.name,
                      categoryIndex: index + 1,
                    );
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  minTileHeight: 64,
                  leading: const Icon(Icons.category, color: AppColors.cyan),
                  title: Text(
                    category.name ?? 'Undefine Name',
                    style: AppTextStyles.body2Medium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 1,
                    color: AppColors.grey50(brightness),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
