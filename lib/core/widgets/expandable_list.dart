import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  final List<Widget> items;
  final int collapsedCount;

  const ExpandableList({
    super.key,
    required this.items,
    this.collapsedCount = 4,
  });

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final visibleItems = _expanded
        ? widget.items
        : widget.items.take(widget.collapsedCount).toList();
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        ...visibleItems,
        if (widget.items.length > widget.collapsedCount)
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Text(_expanded ? l10n.showLess : l10n.showMore),
          ),
      ],
    );
  }
}
