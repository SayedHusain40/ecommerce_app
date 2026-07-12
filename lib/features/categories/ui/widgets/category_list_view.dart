import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final bool isSliver;
  final double space;

  const CategoryListView({
    super.key,
    this.itemCount = 6,
    required this.itemBuilder,
    this.isSliver = false,  this.space = 3,
  });

  @override
  Widget build(BuildContext context) {
    final listView = SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, _) =>  SizedBox(width: space),
        itemBuilder: itemBuilder,
      ),
    );

    return isSliver ? SliverToBoxAdapter(child: listView) : listView;
  }
}