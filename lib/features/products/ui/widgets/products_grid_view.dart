import 'package:ecommerce_app/features/products/ui/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card_shimmer.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_grid.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listenWhen: (previous, current) => current is GetProductFailure,
      listener: (context, state) {
        state.whenOrNull(
          getProductFailure: (_) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to get Products')),
          ),
        );
      },
      buildWhen: (previous, current) =>
          current is GetProductLoading ||
          current is GetProductSuccess ||
          current is GetProductFailure,
      builder: (context, state) {
        return state.maybeWhen(
          getProductLoading: () => ProductGrid(
            itemCount: 8,
            itemBuilder: (_, __) => const ProductCardShimmer(),
          ),
          getProductSuccess: (productsList) => ProductGrid(
            itemCount: productsList.length,
            itemBuilder: (_, index) =>
                ProductCard(product: productsList[index]),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
