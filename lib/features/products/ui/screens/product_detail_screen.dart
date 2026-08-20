import 'dart:math';

import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/app_toast.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/expandable_description.dart';
import 'package:ecommerce_app/core/widgets/start_rating.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_image_gallery.dart';
import 'package:ecommerce_app/features/products/ui/widgets/quantity_selector.dart';
import 'package:ecommerce_app/features/products/ui/widgets/reviews_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentQuantity = 1;

  void setQuantity(int newQuantity) {
    currentQuantity = newQuantity;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    final l10n = context.l10n;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: const Color(0xFFD6D8E5),
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
      child: AppScaffold(
        applyPadding: false,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: isDark
                          ? AppColors.cyan
                          : AppColors.black,
                    ),
                    onPressed: () async {},
                    child: Text(l10n.buyNow),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<CartCubit>().addOrUpdate(
                        cartItemModel: CartItemModel(
                          product: widget.productModel,
                          quantity: currentQuantity,
                        ),
                      );

                      AppToast.success(
                        context,
                        l10n.productAddedToCart,
                        trailing: (close) {
                          return GestureDetector(
                            onTap: () {
                              if (context.canPop()) {
                                context.pop();
                              }
                              context.read<NavCubit>().changeNav(
                                selectedNav: 3,
                              );
                              close();
                            },
                            child: Text(
                              l10n.viewCart,
                              style: AppTextStyles.body3SemiBold.copyWith(
                                color: AppColors.cyan,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: Text('Add To Cart')),
                        const SizedBox(width: 8),
                        SvgPicture.asset(AppIcons.shoppingCart),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Product Image Gallery
              ProductImageGallery(productModel: widget.productModel),

              // Body content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product: Title & Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.productModel.title,
                            style: AppTextStyles.headingH3Bold,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$ ${widget.productModel.discountPercentage}",
                              style: AppTextStyles.headingH3Bold,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "\$ ${widget.productModel.price}",
                              style: AppTextStyles.body2Regular.copyWith(
                                color: AppColors.grey150Light,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.grey150Light,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Product: Product Rating Row
                    Row(
                      children: [
                        StarRating(rating: widget.productModel.rating),
                        const SizedBox(width: 2),
                        Text(
                          widget.productModel.rating.toStringAsFixed(1),
                          style: AppTextStyles.body4SemiBold,
                        ),
                        const SizedBox(width: 2),
                        // reviews
                        Text(
                          '(${widget.productModel.reviews.length} reviews)',
                          style: AppTextStyles.body4SemiBold,
                        ),
                        const Spacer(),
                        if (widget.productModel.stock < 1)
                          Container(
                            padding: const .symmetric(
                              vertical: 1,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: .circular(12),
                              color: AppColors.red,
                            ),
                            child: const Text(
                              'Sold Out',
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Product: description
                    ExpandableDescription(
                      text: widget.productModel.description,
                    ),

                    const SizedBox(height: 12),

                    // QuantitySelector
                    Text('Quantity', style: AppTextStyles.body3SemiBold),
                    const SizedBox(height: 12),

                    QuantitySelector(
                      quantity: currentQuantity,
                      productId: widget.productModel.id,
                      minimumOrderQuantity:
                          widget.productModel.minimumOrderQuantity,
                      onChangeQuantity: setQuantity,
                    ),

                    const SizedBox(height: 12),

                    // Reviews Expansion Tile
                    ReviewsExpansionTile(
                      rating: widget.productModel.rating,
                      reviews: widget.productModel.reviews,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
