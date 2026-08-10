import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.emptyWishlist, width: 240, height: 240),
          const SizedBox(height: 16),
          Text(l10n.wishlistEmptyTitle, style: AppTextStyles.headingH2Bold),
          const SizedBox(height: 16),
          Text(l10n.wishlistEmptySubtitle, style: AppTextStyles.body2Regular),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<NavCubit>().changeNav(selectedNav: 1);
            },
            child: Text(l10n.exploreCategories),
          ),
        ],
      ),
    );
  }
}