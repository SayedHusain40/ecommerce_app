import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/ui/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';

class CheckoutReviewItemsScreen extends StatelessWidget {
  final List<CartItemModel> list;
  const CheckoutReviewItemsScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      applyPadding: true,
      verticalPadding: 12,
      appBar: const AppCustomAppBar(title: 'Items'),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final productModel = list[index];
          return CartItemCard(cartModel: productModel, isDisabled: true);
        },
      ),
    );
  }
}
