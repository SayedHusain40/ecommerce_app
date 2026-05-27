import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/categories_view.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(title: 'Categories'),
      body: Padding(
        padding: .symmetric(vertical: 12, horizontal: 16),
        child: CategoriesView(isGrid: true),
      ),
    );
  }
}
