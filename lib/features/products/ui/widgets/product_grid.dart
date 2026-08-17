import 'package:ecommerce_app/responsive/layout_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';

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

  SliverGridDelegate _gridDelegate(BuildContext context) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      // Max width per card — Flutter fits as many columns as possible using this as the ceiling.
      maxCrossAxisExtent: context.responsive(
        mobile: LayoutDimensions.mobileCardMaxWidth,
        tablet: LayoutDimensions.tabletCardMaxWidth,
        desktop: LayoutDimensions.desktopCardMaxWidth,
      ),
      // Horizontal gap BETWEEN columns (left-right space between cards in the same row).
      crossAxisSpacing: 8,

      // Vertical gap BETWEEN rows (top-bottom space between one row of cards and the next).
      mainAxisSpacing: 12,

      // Card shape: width ÷ height. 0.65 means each card is taller than it is wide (65% as wide as it is tall).
      // Card height is CALCULATED from this ratio + the card's width — you don't set height directly.
      // childAspectRatio: 0.65,
      mainAxisExtent: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    final delegate = _gridDelegate(context);

    return isSilver
        ? SliverGrid.builder(
            itemCount: itemCount,
            gridDelegate: delegate,
            itemBuilder: itemBuilder,
          )
        : GridView.builder(
            itemCount: itemCount,
            gridDelegate: delegate,
            itemBuilder: itemBuilder,
          );
  }
}
