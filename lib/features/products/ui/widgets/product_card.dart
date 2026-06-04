import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(
              RouteNames.productDetailScreen,
              arguments: productModel,
            );
          },
          child: Stack(
            children: [
              Container(
                height: 138,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productModel.thumbnail),
                  ),
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xFFF5F6F8),
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteInDark(brightness),
                  foregroundColor: AppColors.blackInDark(brightness),
                  radius: 12,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined, size: 12),
                  ),
                ),
              ),
              if (productModel.stock < 1)
                Positioned(
                  bottom: 6,
                  left: 6,
                  child: Container(
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
                ),
            ],
          ),
        ),
        Text(
          productModel.title,
          style: AppTextStyles.body2Medium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          '\$${productModel.discountPercentage}',
          style: AppTextStyles.body3SemiBold,
        ),
        Text(
          '\$${productModel.price}',
          style: AppTextStyles.body4Regular.copyWith(
            color: AppColors.grey100,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.grey100,
          ),
        ),
      ],
    );
  }
}
