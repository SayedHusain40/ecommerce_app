import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_badge.dart';
import 'package:ecommerce_app/core/widgets/app_confirm_bottom_sheet.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/empty_widget.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/ui/widgets/cart_item_card.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_cubit.dart';
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
    final l10n = context.l10n;

    return BlocBuilder<CartCubit, List<CartItemModel>>(
      builder: (context, cartList) {
        final total = cartList.fold(
          0.0,
          (previousValue, element) =>
              previousValue +
              (element.quantity * element.product.discountedPrice),
        );

        final totalQuantity = cartList.fold(
          0,
          (previousValue, element) => previousValue + element.quantity,
        );

        return AppScaffold(
          verticalPadding: 12,
          appBar: cartList.isEmpty
              ? null
              : AppCustomAppBar(
                  title: l10n.myCart,
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
                    const SizedBox(width: 5),
                    AppBadge<CartCubit>(
                      sumQuantity: true,
                      SvgPicture.asset(
                        AppIcons.inactiveShoppingCart(brightness),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: cartList.isEmpty
              ? null
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: .min,
                      crossAxisAlignment: .start,
                      children: [
                        Text(l10n.orderInfo, style: AppTextStyles.body1Medium),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 32,
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            crossAxisAlignment: .center,
                            children: [
                              Text(
                                l10n.subtotal,
                                style: AppTextStyles.body3Regular.copyWith(
                                  color: AppColors.grey150(brightness),
                                ),
                              ),
                              Text(
                                '\$${total.toStringAsFixed(2)}',
                                style: AppTextStyles.body3Regular.copyWith(
                                  color: AppColors.grey150(brightness),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32,
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            crossAxisAlignment: .center,
                            children: [
                              Text(
                                l10n.shippingCost,
                                style: AppTextStyles.body3Regular.copyWith(
                                  color: AppColors.grey150(brightness),
                                ),
                              ),
                              Text(
                                '\$0.00',
                                style: AppTextStyles.body3Regular.copyWith(
                                  color: AppColors.grey150(brightness),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            crossAxisAlignment: .center,
                            children: [
                              Text(
                                l10n.total,
                                style: AppTextStyles.body1Medium,
                              ),
                              Text(
                                '\$${total.toStringAsFixed(2)}',
                                style: AppTextStyles.body1Medium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CheckoutCubit>().totalOrder =
                                double.tryParse(total.toStringAsFixed(2));
                            context.read<CheckoutCubit>().ordersList = cartList;

                            context.pushNamed(
                              RouteNames.checkoutShippingScreen,
                            );
                          },

                          child: Text(l10n.checkoutWithCount(totalQuantity)),
                        ),
                      ],
                    ),
                  ),
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
                    final productID = cartModel.product.id;
                    return CartItemCard(
                      cartModel: cartModel,

                      trailing: Column(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () =>
                                onDeleteCartProduct(context, productID),
                            child: SvgPicture.asset(
                              AppIcons.trash,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
