import 'dart:async';

import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
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
  final TextEditingController searchController = TextEditingController();
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return BlocProvider(
      create: (ctx) =>
          getIt<ProductCubit>()..getProductsBySearch(searchQuery: ''),
      child: Builder(
        builder: (innerContext) {
          return GestureDetector(
            onTap: () => FocusScope.of(innerContext).unfocus(),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
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
                    onChanged: (value) {
                      timer?.cancel();
                      timer = Timer(const Duration(milliseconds: 600), () {
                        innerContext
                            .read<ProductCubit>()
                            .getProductsBySearch(searchQuery: value);
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Expanded(child: ProductsGridView<ProductCubit>()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}