import 'package:ecommerce_app/core/helpers/app_toast.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_card_shimmer.dart';
import 'package:ecommerce_app/features/products/ui/widgets/product_grid.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView<T extends Cubit<ProductState>> extends StatelessWidget {
  final bool isSilver;
  final bool saveSearch;
  const ProductsGridView({
    super.key,
    this.isSilver = false,
    this.saveSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget sliverSafe(Widget child) =>
        isSilver ? SliverToBoxAdapter(child: child) : child;

    final l10n = context.l10n;

    return BlocConsumer<T, ProductState>(
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
          initial: () =>
              sliverSafe(Center(child: Text(l10n.typeToSearchProducts))),
          loading: () => ProductGrid(
            isSilver: isSilver,
            itemCount: 8,
            itemBuilder: (_, _) => const ProductCardShimmer(),
          ),
          success: (productsList) => productsList.isEmpty
              ? sliverSafe(Center(child: Text(l10n.noProductsFound)))
              : ProductGrid(
                  isSilver: isSilver,
                  itemCount: productsList.length,
                  itemBuilder: (_, index) => ProductCard(
                    productModel: productsList[index],
                    saveSearch: saveSearch,
                  ),
                ),
          orElse: () =>
              sliverSafe(Center(child: Text(l10n.somethingWentWrong))),
        );
      },
    );
  }
}
