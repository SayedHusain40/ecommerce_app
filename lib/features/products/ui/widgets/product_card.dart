import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  final bool saveSearch;
  final VoidCallback? onDeleteProduct;

  const ProductCard({
    super.key,
    required this.productModel,
    this.saveSearch = false,
    this.onDeleteProduct,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (saveSearch) {
              context.read<ProductCubit>().saveSearchQuery(
                productModel: productModel,
              );
              context.pushReplacementNamed(
                RouteNames.productDetailScreen,
                arguments: productModel,
              );
            } else {
              context.pushNamed(
                RouteNames.productDetailScreen,
                arguments: productModel,
              );
            }
          },
          child: Stack(
            children: [
              Container(
                height: 138,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productModel.thumbnail),
                  ),
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFFF5F6F8),
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteInDark(brightness),
                  foregroundColor: AppColors.blackInDark(brightness),
                  radius: 12,
                  child: BlocBuilder<WishlistCubit, List<ProductModel>>(
                    builder: (context, _) {
                      final isFavorite = context
                          .read<WishlistCubit>()
                          .isFavorite(productId: productModel.id);

                      return IconButton(
                        padding: EdgeInsets.zero,
                        onPressed:
                            onDeleteProduct ??
                            () {
                              context
                                  .read<WishlistCubit>()
                                  .toggleFavoriteProduct(
                                    productModel: productModel,
                                  );
                            },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 12,
                          color: isFavorite ? AppColors.red : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (productModel.stock < 1)
                Positioned(
                  bottom: 6,
                  left: 6,
                  child: Container(
                    padding: const .symmetric(vertical: 1, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: .circular(12),
                      color: AppColors.red,
                    ),
                    child: const Text(
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
