import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final bool isSilver;

  const ProductGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.isSilver = false,
  });

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 12,
    mainAxisExtent: 200,
  );

  @override
  Widget build(BuildContext context) {
    return isSilver
        ? SliverGrid.builder(
            itemCount: itemCount,
            gridDelegate: _gridDelegate,
            itemBuilder: itemBuilder,
          )
        : GridView.builder(
            itemCount: itemCount,
            gridDelegate: _gridDelegate,
            itemBuilder: itemBuilder,
          );
  }
}
