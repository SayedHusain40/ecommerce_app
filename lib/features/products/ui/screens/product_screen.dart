import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String? category;

  const ProductScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final String appBarTitle = category ?? 'Products';
    return Scaffold(
      appBar: AppCustomAppBar(title: appBarTitle),
      body: Padding(
        padding: .symmetric(vertical: 12, horizontal: 16),
        child: ProductsGridView(category: category),
      ),
    );
  }
}
