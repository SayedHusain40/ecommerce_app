import 'package:ecommerce_app/features/products/ui/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card_shimmer.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_grid.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView extends StatefulWidget {
  final String? category;
  const ProductsGridView({super.key, this.category});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      // this is from new cubit..if(category != null)
      // not affect first cubit "not dispaer products in home screen"
      context.read<ProductCubit>().getProductsByCategory(
        category: widget.category!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listenWhen: (previous, current) =>
          current is GetProductsFailure ||
          current is GetProductsByCategoryFailure,
      listener: (context, state) {
        state.whenOrNull(
          getProductsFailure: (_) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to get Products')),
          ),
          getProductsByCategoryFailure: (_) =>
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to get Products')),
              ),
        );
      },
      buildWhen: (previous, current) =>
          current is GetProductsLoading ||
          current is GetProductsSuccess ||
          current is GetProductsFailure ||
          current is GetProductsByCategoryLoading ||
          current is GetProductsByCategorySuccess ||
          current is GetProductsByCategoryFailure,
      builder: (context, state) {
        if (widget.category == null) {
          return state.maybeWhen(
            getProductsLoading: () => ProductGrid(
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
        }

        return state.maybeWhen(
          getProductByCategoryLoading: () => ProductGrid(
            itemCount: 8,
            itemBuilder: (_, __) => const ProductCardShimmer(),
          ),
          getProductsByCategorySuccess: (productsList) => ProductGrid(
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
