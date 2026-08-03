import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
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
              const Text('Delete product from wishlist'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  wishlistCubit.removeFromWishlist(productId: productID);
                  context.pop();
                },
                child: const Text('Delete a product'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(
        title: 'Wishlist',
        centerTitle: true,
        onBackPressed: () {
          context.read<NavCubit>().changeNav(selectedNav: 0);
        },
        actions: [
          IconButton(
            onPressed: () {
              context.read<WishlistCubit>().clearWishList();
            },
            icon: SvgPicture.asset(AppIcons.trash, width: 24, height: 24),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: BlocBuilder<WishlistCubit, List<ProductModel>>(
          builder: (context, wishList) {
            return wishList.isEmpty
                ? const _EmptyWishlist()
                : ProductGrid(
                    itemCount: wishList.length,
                    itemBuilder: (context, index) {
                      final productModel = wishList[index];
                      return ProductCard(
                        productModel: productModel,
                        onDeleteProduct: () => onDeleteProduct(productModel.id),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

class _EmptyWishlist extends StatelessWidget {
  const _EmptyWishlist();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.emptyWishlist, width: 240, height: 240),
          const SizedBox(height: 16),
          Text('Your wishlist is empty', style: AppTextStyles.headingH2Bold),
          const SizedBox(height: 16),
          Text(
            'Tap heart button to start saving your favorite items.',
            style: AppTextStyles.body2Regular,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                RouteNames.appAuthState,
                predicate: (route) => false,
              );
            },
            child: const Text('Explore Categories'),
          ),
        ],
      ),
    );
  }
}
