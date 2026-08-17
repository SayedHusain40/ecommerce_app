import 'package:ecommerce_app/responsive/layout_dimensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < LayoutDimensions.mobile) return mobileBody;
        if (constraints.maxWidth < LayoutDimensions.desktop) return tabletBody ?? mobileBody;
        return desktopBody ?? tabletBody ?? mobileBody;
      },
    );
  }
}