import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HorizontalListView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final bool isSliver;
  final double space;

  const HorizontalListView({
    super.key,
    this.itemCount = 6,
    required this.itemBuilder,
    this.isSliver = false,
    this.space = 3,
  });

  @override
  Widget build(BuildContext context) {
    // ListView is always lazy -> only builds visible items (horizontal) even when used in sliver
    final listView = SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        scrollCacheExtent: const ScrollCacheExtent.pixels(5000), 
        itemCount: itemCount,
        separatorBuilder: (_, _) => SizedBox(width: space),
        itemBuilder: itemBuilder,
      ),
    );

    // SliverList can't be used here (no scrollDirection, always follows parent's direction)
    return isSliver ? SliverToBoxAdapter(child: listView) : listView;
  }
}
