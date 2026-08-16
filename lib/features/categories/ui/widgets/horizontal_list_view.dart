import 'package:flutter/material.dart';

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
    final listHorizontalView = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: .min,
        crossAxisAlignment: .center, // ⬅️ add this
        children: [
          for (int i = 0; i < itemCount; i++) ...[
            itemBuilder(context, i),
            if (i != itemCount - 1) SizedBox(width: space),
          ],
        ],
      ),
    );

    return isSliver
        ? SliverToBoxAdapter(child: listHorizontalView)
        : listHorizontalView;
  }
}
