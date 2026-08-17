import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_browse_list.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppScaffold(
      verticalPadding: 12,
      appBar: AppCustomAppBar(title: l10n.categories),
      body: const CategoryBrowseList(isGrid: true),
    );
  }
}
