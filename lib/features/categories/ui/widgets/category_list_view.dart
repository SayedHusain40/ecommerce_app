import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  const CategoryListView({
    super.key,
     this.itemCount = 6,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
