import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyWidget extends StatelessWidget {
  final String emptyImage;
  final String emptyTitle;
  final String emptySubtitle;
  const EmptyWidget({
    super.key,
    required this.emptyImage,
    required this.emptyTitle,
    required this.emptySubtitle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            // TODO need test, and save it as notes
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(emptyImage, width: 240, height: 240),
                  const SizedBox(height: 16),
                  Text(
                    emptyTitle,
                    style: AppTextStyles.headingH2Bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    emptySubtitle,
                    style: AppTextStyles.body2Regular,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NavCubit>().changeNav(selectedNav: 1);
                    },
                    child: Text(l10n.exploreCategories),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
