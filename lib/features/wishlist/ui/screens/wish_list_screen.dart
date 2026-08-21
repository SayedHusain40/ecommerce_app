import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/widgets/app_confirm_bottom_sheet.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/empty_widget.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_grid.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late final WishlistCubit wishlistCubit;
  @override
  void initState() {
    super.initState();
    wishlistCubit = context.read<WishlistCubit>();
  }

  void onDeleteProduct(int productID) {
    showAppConfirmBottomSheet(
      context: context,
      message: context.l10n.deleteProductFromWishlistConfirm,
      onConfirm: () => wishlistCubit.removeFromWishlist(productId: productID),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<WishlistCubit, List<ProductModel>>(
      builder: (context, wishList) {
        return AppScaffold(
          verticalPadding: 12,
          appBar: wishList.isEmpty
              ? null
              : AppCustomAppBar(
                  title: l10n.wishlist,
                  centerTitle: true,
                  onBackPressed: () {
                    context.read<NavCubit>().changeNav(selectedNav: 0);
                  },
                  actions: [
                    GestureDetector(
                      onTap: () {
                        context.read<WishlistCubit>().clearWishList();
                      },
                      child: SvgPicture.asset(
                        AppIcons.trash,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
          body: wishList.isEmpty
              ? EmptyWidget(
                  emptyImage: AppImages.emptyWishlist,
                  emptyTitle: l10n.wishlistEmptyTitle,
                  emptySubtitle: l10n.wishlistEmptySubtitle,
                )
              : ProductGrid(
                  itemCount: wishList.length,
                  itemBuilder: (context, index) {
                    final productModel = wishList[index];
                    return ProductCard(productModel: productModel);
                  },
                ),
        );
      },
    );
  }
}
