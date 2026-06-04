import 'dart:ui';

import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/expandable_description.dart';
import 'package:ecommerce_app/core/widgets/start_rating.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_image_gallery.dart';
import 'package:ecommerce_app/features/products/ui/widgets/quantity_selector.dart';
import 'package:ecommerce_app/features/products/ui/widgets/reviews_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xFFD6D8E5),
        statusBarIconBrightness: brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: Scaffold(
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
                    child: const Text('Buy Now'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Add To Cart'),
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Product Image Gallery
                ProductImageGallery(productModel: productModel),

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
                              productModel.title,
                              style: AppTextStyles.headingH3Bold,
                            ),
                          ),
                          const SizedBox(width: 13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$ ${productModel.discountPercentage}",
                                style: AppTextStyles.headingH3Bold,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "\$ ${productModel.price}",
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
                          StarRating(rating: productModel.rating),
                          const SizedBox(width: 2),
                          Text(
                            productModel.rating.toStringAsFixed(1),
                            style: AppTextStyles.body4SemiBold,
                          ),
                          const SizedBox(width: 2),
                          // reviews
                          Text(
                            '(${productModel.reviews.length} reviews)',
                            style: AppTextStyles.body4SemiBold,
                          ),
                          Spacer(),
                          if (productModel.stock < 1)
                            Container(
                              padding: .symmetric(vertical: 1, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: .circular(12),
                                color: AppColors.red,
                              ),
                              child: Text(
                                'Sold Out',
                                style: TextStyle(color: AppColors.black),
                              ),
                            ),
                        ],
                      ),

                      SizedBox(height: 12),

                      // Product: description
                      ExpandableDescription(text: productModel.description),

                      const SizedBox(height: 12),

                      // QuantitySelector
                      Text('Quantity', style: AppTextStyles.body3SemiBold),
                      SizedBox(height: 12),
                      QuantitySelector(),

                      SizedBox(height: 12),

                      // Reviews Expansion Tile
                      ReviewsExpansionTile(
                        rating: productModel.rating,
                        reviews: productModel.reviews,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
