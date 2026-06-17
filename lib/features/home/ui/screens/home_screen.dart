import 'package:ecommerce_app/core/widgets/search_icon_button.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_banner.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_categories_section.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_products_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [SearchIconButton(), SizedBox(width: 15)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // ---- Banner Section ----
            HomeBanner(),

            SizedBox(height: 24),

            // ---- Category Section ----
            HomeCategoriesSection(),

            SizedBox(height: 24),

            // ---- Latest Products Section ----
            Expanded(child: HomeProductsSection()),
          ],
        ),
      ),
    );
  }
}
