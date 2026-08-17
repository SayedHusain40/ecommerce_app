import 'package:ecommerce_app/responsive/layout_dimensions.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final bool extendBodyBehindAppBar;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final bool applyPadding;
  final bool? applySafeArea; // null = auto-decide based on appBar
  final double verticalPadding; // optional, defaults to 0
  final Color?
  backgroundColor; // optional, defaults to theme's scaffold background

  const AppScaffold({
    super.key,
    this.extendBodyBehindAppBar = false,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.applyPadding = true,
    this.applySafeArea,
    this.verticalPadding = 0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = applyPadding
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: verticalPadding,
            ),
            child: body,
          )
        : body;

    // If appBar exists, top is already safe — SafeArea only needed when there's no appBar.
    // applySafeArea lets you override that default manually either way.
    final useSafeArea = applySafeArea ?? (appBar == null);

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor,
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: context.isDesktop
          ? Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: LayoutDimensions.desktop,
                ),
                child: content,
              ),
            )
          : content,
    );
  }
}
