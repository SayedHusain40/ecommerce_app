import 'package:ecommerce_app/features/products/ui/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card_shimmer.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_grid.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// was <T extends ProductCubit> :: for extend only
class ProductsGridView<T extends Cubit<ProductState>> extends StatelessWidget {
  final bool isSilver;
  const ProductsGridView({super.key, this.isSilver = false});

  @override
  Widget build(BuildContext context) {
    Widget sliverSafe(Widget child) =>
        isSilver ? SliverToBoxAdapter(child: child) : child;

    return BlocConsumer<T, ProductState>(
      listenWhen: (previous, current) => current is ProductsFailure,
      listener: (context, state) {
        state.whenOrNull(
          failure: (_) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to get Products')),
          ),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () =>
              sliverSafe(Center(child: Text('Type to search for products...'))),
          loading: () => ProductGrid(
            isSilver: isSilver,
            itemCount: 8,
            itemBuilder: (_, _) => const ProductCardShimmer(),
          ),
          success: (productsList) => productsList.isEmpty
              ? sliverSafe(Center(child: Text('No Products Found')))
              : ProductGrid(
                  isSilver: isSilver,
                  itemCount: productsList.length,
                  itemBuilder: (_, index) =>
                      ProductCard(productModel: productsList[index]),
                ),
          orElse: () =>
              sliverSafe(Center(child: Text('Something Went Wrong!'))),
        );
      },
    );
  }
}
