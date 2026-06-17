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
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listenWhen: (previous, current) => current is GetProductsFailure,
      listener: (context, state) {
        state.whenOrNull(
          getProductsFailure: (_) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to get Products')),
          ),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () =>
              const Center(child: Text('Type to search for products...')),
          // For Loading
          getProductsLoading: () => ProductGrid(
            itemCount: 8,
            itemBuilder: (_, __) => const ProductCardShimmer(),
          ),
          // For Loading Get Data
          getProductSuccess: (productsList) => productsList.isEmpty
              ? Center(child: Text('No Products Found'))
              : ProductGrid(
                  itemCount: productsList.length,
                  itemBuilder: (_, index) =>
                      ProductCard(productModel: productsList[index]),
                ),
          // For Else (ex: error, ect.)
          orElse: () => Center(child: Text('Something Went Wrong!')),
        );
      },
    );
  }
}
