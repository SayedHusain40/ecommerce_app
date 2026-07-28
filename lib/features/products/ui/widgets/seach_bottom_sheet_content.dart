import 'dart:async';

import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchBottomSheetContent extends StatefulWidget {
  const SearchBottomSheetContent({super.key});

  @override
  State<SearchBottomSheetContent> createState() =>
      _SearchBottomSheetContentState();
}

class _SearchBottomSheetContentState extends State<SearchBottomSheetContent> {
  TextEditingController searchController = TextEditingController();
  Timer? timer;

  late final List<ProductModel> _searchHistory;
  late final ProductCubit productCubit;

  @override
  void initState() {
    super.initState();
    productCubit = context.read<ProductCubit>();

    productCubit.getProductsBySearch(searchQuery: '');
    final result = productCubit.getSearchHistory();
    _searchHistory = result;
  }

  @override
  void dispose() {
    timer?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Builder(
      builder: (innerContext) {
        return GestureDetector(
          onTap: () => FocusScope.of(innerContext).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppImages.logo(brightness)),
                    GestureDetector(
                      onTap: () => innerContext.pop(),
                      child: SvgPicture.asset(AppIcons.cancel(brightness)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: SvgPicture.asset(
                        AppIcons.search(brightness),
                        width: 24,
                        height: 24,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    hint: Text(
                      'Search for products...',
                      style: AppTextStyles.body3Regular,
                    ),
                  ),
                  onChanged: (value) {
                    timer?.cancel();
                    timer = Timer(const Duration(milliseconds: 600), () {
                      innerContext.read<ProductCubit>().getProductsBySearch(
                        searchQuery: value,
                      );
                    });
                  },
                ),
                const SizedBox(height: 10),
                if (_searchHistory.isNotEmpty)
                  Text('Search Result:', style: AppTextStyles.headingH3Bold),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 5, // horizontal gap between chips
                  runSpacing: 0, // vertical gap between wrapped line
                  children: _searchHistory
                      .map(
                        (productModel) => GestureDetector(
                          onTap: () {
                            searchController.text = productModel.title;
                            productCubit.getProductsBySearch(
                              searchQuery: productModel.title,
                            );
                          },
                          child: Chip(
                            shape: const StadiumBorder(),
                            label: Text(
                              productModel.title,
                              style: AppTextStyles.body3Regular,
                            ),
                            backgroundColor: AppColors.grey50(brightness),
                            onDeleted: () {
                              setState(() {
                                productCubit.deleteSearchProduct(
                                  id: productModel.id,
                                );
                                _searchHistory.remove(productModel);
                                productCubit.getProductsBySearch(
                                  searchQuery: '',
                                );
                                searchController.text = '';
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 10),
                const Expanded(
                  child: ProductsGridView<ProductCubit>(saveSearch: true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
