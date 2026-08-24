import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/app_toast.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:ecommerce_app/features/products/ui/widgets/favorite_button.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final brightness = context.brightness;

    return BlocConsumer<CategoryProductsCubit, ProductState>(
      listenWhen: (previous, current) => current is ProductsFailure,
      listener: (context, state) {
        state.whenOrNull(
          failure: (_) {
            AppToast.error(context, l10n.failedToGetProducts);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => Center(child: Text(l10n.typeToSearchProducts)),
          loading: () => ListView.separated(
            itemCount: 6,
            separatorBuilder: (_, _) => const SizedBox(height: 5),
            itemBuilder: (_, _) => const ProductCardShimmer(),
          ),
          success: (productsList) => productsList.isEmpty
              ? Center(child: Text(l10n.noProductsFound))
              : ListView.separated(
                  itemCount: productsList.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (_, index) {
                    final productModel = productsList[index];
                    return Container(
                      constraints: const BoxConstraints(minHeight: 150),
                      decoration: BoxDecoration(
                        borderRadius: .circular(12),
                        border: Border.all(
                          color: AppColors.grey150(brightness),
                        ),
                      ),
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
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F6F8),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: .circular(12),
                                        bottomLeft: .circular(12),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          productModel.thumbnail,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 6,
                                    left: 6,
                                    child: FavoriteButton(
                                      productModel: productModel,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),

                            // content
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                child: Column(
                                  crossAxisAlignment: .center,
                                  mainAxisAlignment: .center,
                                  children: [
                                    Text(
                                      productModel.title,
                                      style: AppTextStyles.body2Medium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: .center,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '\$${productModel.discountPriceString}',
                                      style: AppTextStyles.body3SemiBold,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '\$${productModel.price}',
                                      style: AppTextStyles.body4Regular
                                          .copyWith(
                                            color: AppColors.grey150(
                                              brightness,
                                            ),
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                    ),
                                    const SizedBox(height: 2),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ), // or any value you want
                                        ),
                                      ),
                                      onPressed: () async {
                                        context.read<CartCubit>().addOrUpdate(
                                          cartItemModel: CartItemModel(
                                            product: productModel,
                                            quantity: 1,
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
                                                context
                                                    .read<NavCubit>()
                                                    .changeNav(selectedNav: 3);
                                                close();
                                              },
                                              child: Text(
                                                l10n.viewCart,
                                                style: AppTextStyles
                                                    .body3SemiBold
                                                    .copyWith(
                                                      color: AppColors.cyan,
                                                    ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Add To Cart'),
                                          const SizedBox(width: 8),
                                          SvgPicture.asset(
                                            AppIcons.shoppingCart,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
          orElse: () => Center(child: Text(l10n.somethingWentWrong)),
        );
      },
    );
  }
}
