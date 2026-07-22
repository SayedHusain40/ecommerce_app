import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_browse_list.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final Function(int newSelectedCategoryIndex, String? categoryName) onSelectCategory;
  const CategoryScreen({super.key, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppCustomAppBar(title: 'Categories'),
      body: Padding(
        padding: const .symmetric(vertical: 12, horizontal: 16),
        child: CategoryBrowseList(isGrid: true, onSelectCategory: onSelectCategory),
      ),
    );
  }
}
