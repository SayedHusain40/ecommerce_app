import 'package:ecommerce_app/features/products/ui/widgets/seach_bottom_sheet_content.dart';
import 'package:flutter/material.dart';

void showSearchBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (_) => const SearchBottomSheetContent(),
  );
}
