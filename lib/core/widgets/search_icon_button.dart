import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/features/products/ui/widgets/show_search_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return GestureDetector(
      onTap: () => showSearchBottomSheet(context),
      child: SvgPicture.asset(AppIcons.search(brightness)),
    );
  }
}