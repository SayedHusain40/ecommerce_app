import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/expandable_list.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_checkbox/flutter_checkbox.dart';
import 'package:flutter_svg/svg.dart';

class FilterContentBottomSheet extends StatefulWidget {
  const FilterContentBottomSheet({super.key});

  @override
  State<FilterContentBottomSheet> createState() =>
      _FilterContentBottomSheetState();
}

class _FilterContentBottomSheetState extends State<FilterContentBottomSheet> {
  late final categoryProductsCubit = context.read<CategoryProductsCubit>();

  SortOptions? selectedSort;

  @override
  void initState() {
    super.initState();
    selectedSort = categoryProductsCubit.selectedSortOptions;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ---- Top: fixed header row (title + cancel icon) ----
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filter', style: AppTextStyles.body1Medium),
              GestureDetector(
                onTap: () => context.pop(),
                child: SvgPicture.asset(AppIcons.cancel(brightness)),
              ),
            ],
          ),
        ),

        // ---- Middle: scrollable filter content ----
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  'Sort By',
                  style: AppTextStyles.body2Medium.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 3.0,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                ExpandableList(
                  items: SortOptions.values.map((e) {
                    final isSelected = selectedSort == e;
                    return InkWell(
                      onTap: () {
                        setState(() => selectedSort = isSelected ? null : e);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.displayName, style: AppTextStyles.body2Medium),
                          FlutterCheckbox(
                            value: isSelected,
                            style: CheckboxStyle(
                              size: 32,
                              activeColor: AppColors.blue,
                              borderRadius: 6,
                              borderColor: AppColors.grey150(brightness),
                              borderWidth: 2,
                            ),
                            onChanged: (value) {
                              setState(() => selectedSort = value! ? e : null);
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 5),
                const Divider(color: AppColors.black),
              ],
            ),
          ),
        ),

        // ---- Bottom: fixed Apply button ----
        if (selectedSort != null)
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  categoryProductsCubit.setSortOptions(selectedSort);

                  final categoryName =
                      categoryProductsCubit.selectedCategoryName;
                  if (categoryName != null) {
                    categoryProductsCubit.getProductsByCategorySort(
                      categoryName: categoryName,
                    );
                  } else {
                    categoryProductsCubit.getProducts();
                  }
                  context.pop();
                },
                child: const Text('Apply'),
              ),
            ),
          ),
      ],
    );
  }
}
