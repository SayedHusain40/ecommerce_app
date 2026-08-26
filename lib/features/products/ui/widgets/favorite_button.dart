import 'package:ecommerce_app/core/helpers/app_toast.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final ProductModel productModel;
  final double radius;
  final double iconSize;
  final bool isNeedConformDelete;

  const FavoriteButton({
    super.key,
    required this.productModel,
    this.radius = 16,
    this.iconSize = 12,
    this.isNeedConformDelete = false,
  });

  void _confirmRemove(BuildContext context, WishlistCubit wishlistCubit) {
    final l10n = context.l10n;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
      ),
      constraints: const BoxConstraints(),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.deleteProductFromWishlistConfirm),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  wishlistCubit.removeFromWishlist(productId: productModel.id);
                  sheetContext.pop();
                },
                child: Text(l10n.deleteAProduct),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => sheetContext.pop(),
                child: Text(l10n.cancel),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();

    final brightness = context.brightness;
    final l10n = context.l10n;

    return CircleAvatar(
      backgroundColor: AppColors.whiteInDark(brightness),
      foregroundColor: AppColors.blackInDark(brightness),
      radius: radius,
      // child: BlocBuilder<WishlistCubit, Map<int, WishlistItemModel>>(
      //   builder: (context, wishListMap) {
      //     debugPrint('BlocBuilder REBUILT for productId: ${productModel.id}');
      //     final isFavorite = context.read<WishlistCubit>().isFavorite(
      //       productId: productModel.id,
      //     );
      child: BlocSelector<WishlistCubit, Map<int, WishlistItemModel>, bool>(
        selector: (wishListMap) => wishListMap.containsKey(productModel.id),
        builder: (context, isFavorite) {
          debugPrint(
            'FavoriteButton REBUILT for productId: ${productModel.id}',
          );

          return IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (isFavorite) {
                if (isNeedConformDelete) {
                  _confirmRemove(context, wishlistCubit);
                } else {
                  wishlistCubit.removeFromWishlist(productId: productModel.id);
                }
              } else {
                AppToast.success(
                  context,
                  l10n.productAddedToWishlist,
                  trailing: (close) => GestureDetector(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      }
                      context.read<NavCubit>().changeNav(selectedNav: 2);
                      close();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Go to Favorites',
                          style: AppTextStyles.body4Regular,
                        ),
                        const SizedBox(width: 2),
                        const Icon(Icons.arrow_right_alt, size: 20),
                      ],
                    ),
                  ),
                  showCloseButton: true,
                );
                context.read<WishlistCubit>().toggleFavoriteProduct(
                  productModel: productModel,
                );
              }
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              size: iconSize,
              color: isFavorite ? AppColors.red : null,
            ),
          );
        },
      ),
    );
  }
}
