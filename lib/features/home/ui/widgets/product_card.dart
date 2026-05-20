import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 138,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail ?? ''),
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
          ],
        ),
        Text(
          product.title ?? 'Unknown',
          style: AppTextStyles.body2Medium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          product.discountPercentage != null
              ? '\$${product.discountPercentage}'
              : 'Unknown',
          style: AppTextStyles.body3SemiBold,
        ),
        Text(
          product.price != null ? '\$${product.price}' : 'Unknown',
          style: AppTextStyles.body4Regular.copyWith(
            color: AppColors.grey100,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
