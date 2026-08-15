import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_grid.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:ecommerce_app/features/wishlist/ui/widgets/empty_wish_list.dart';
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
    final l10n = context.l10n;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
      ),
      constraints: const BoxConstraints(),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.deleteProductFromWishlistConfirm),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  wishlistCubit.removeFromWishlist(productId: productID);
                  context.pop();
                },
                child: Text(l10n.deleteAProduct),
              ),
              const SizedBox(height: 12),

              TextButton(
                onPressed: () => context.pop(),
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
    final l10n = context.l10n;

    return AppScaffold(
      applyPadding: false,
      appBar: AppCustomAppBar(
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
            child: SvgPicture.asset(AppIcons.trash, width: 24, height: 24),
          ),
        ],
      ),
      body: BlocBuilder<WishlistCubit, List<ProductModel>>(
        builder: (context, wishList) {
          return wishList.isEmpty
              ? const EmptyWishList()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: ProductGrid(
                    itemCount: wishList.length,
                    itemBuilder: (context, index) {
                      final productModel = wishList[index];
                      return ProductCard(productModel: productModel);
                    },
                  ),
                );
        },
      ),
    );
  }
}
