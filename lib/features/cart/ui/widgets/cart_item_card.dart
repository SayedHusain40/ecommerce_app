import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_confirm_bottom_sheet.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/favorite_button.dart';
import 'package:ecommerce_app/features/products/ui/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel cartModel;

  const CartItemCard({super.key, required this.cartModel});

  void onDeleteCartProduct(BuildContext context, int productID) {
    showAppConfirmBottomSheet(
      context: context,
      message: context.l10n.deleteProductFromCartConfirm,
      onConfirm: () =>
          context.read<CartCubit>().deleteProduct(productId: productID),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 120),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F8),
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(cartModel.product.thumbnail),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 6,
                    child: FavoriteButton(productModel: cartModel.product),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartModel.product.title,
                    style: AppTextStyles.body2Medium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${cartModel.product.discountPriceString}',
                    style: AppTextStyles.body3SemiBold,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${cartModel.product.price}',
                    style: AppTextStyles.body4Regular.copyWith(
                      color: AppColors.grey150(brightness),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const Spacer(),
                  QuantitySelector(
                    quantity: cartModel.quantity,
                    productId: cartModel.product.id,
                    minimumOrderQuantity:
                        cartModel.product.minimumOrderQuantity,
                    isComeFromCartScreen: true,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      onDeleteCartProduct(context, cartModel.product.id),
                  child: SvgPicture.asset(
                    AppIcons.trash,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
