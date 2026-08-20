import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_confirm_bottom_sheet.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/empty_widget.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
  }

  int currentQuantity = 1;

  void setQuantity(int newQuantity) {
    currentQuantity = newQuantity;
  }

  void onDeleteCartProduct(int productID) {
    showAppConfirmBottomSheet(
      context: context,
      message: context.l10n.deleteProductFromCartConfirm,
      onConfirm: () => cartCubit.deleteProduct(productId: productID),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final l10n = context.l10n;

    return BlocBuilder<CartCubit, List<CartItemModel>>(
      builder: (context, cartList) {
        return AppScaffold(
          verticalPadding: 12,
          appBar: cartList.isEmpty
              ? null
              : AppCustomAppBar(
                  title: 'My Cart',
                  centerTitle: true,
                  onBackPressed: () {
                    context.read<NavCubit>().changeNav(selectedNav: 0);
                  },
                  actions: [
                    GestureDetector(
                      onTap: () {
                        cartCubit.clearCart();
                      },
                      child: SvgPicture.asset(
                        AppIcons.trash,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
          body: cartList.isEmpty
              ? EmptyWidget(
                  emptyImage: AppImages.emptyCart,
                  emptyTitle: l10n.cartEmptyTitle,
                  emptySubtitle: l10n.cartEmptySubtitle,
                )
              : ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final cartModel = cartList[index];
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: Row(
                            crossAxisAlignment: .start,
                            children: [
                              // image
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F6F8),
                                  borderRadius: .circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      cartModel.product.thumbnail,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      cartModel.product.title,
                                      style: AppTextStyles.body2Medium,
                                      overflow: .ellipsis,
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '\$${cartModel.product.price}',
                                      style: AppTextStyles.body3SemiBold,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '\$${cartModel.product.discountPercentage}',
                                      style: AppTextStyles.body4Regular
                                          .copyWith(
                                            color: AppColors.grey150(
                                              brightness,
                                            ),
                                          ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: .spaceBetween,
                                      children: [
                                        QuantitySelector(
                                          quantity: cartModel.quantity,
                                          productId: cartModel.product.id,
                                          minimumOrderQuantity: cartModel
                                              .product
                                              .minimumOrderQuantity,
                                          isComeFromCartScreen: true,
                                        ),
                                        GestureDetector(
                                          onTap: () => onDeleteCartProduct(
                                            cartModel.product.id,
                                          ),
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
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
