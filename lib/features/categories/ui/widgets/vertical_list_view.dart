import 'package:flutter/material.dart';

class VerticalListView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double space;

  const VerticalListView({
    super.key,
    this.itemCount = 6,
    required this.itemBuilder,
    this.space = 3,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      separatorBuilder: (_, _) => SizedBox(width: space),
      itemBuilder: itemBuilder,
    );
  }
}
