import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({super.key});

  static const double _maxBottomPadding = 92;
  static const double _minBottomPadding = 16;
  static const double _tallHeight = 700; // height where padding = 92
  static const double _shortHeight = 500; // height where padding = 16

  double _responsiveBottomPadding(double maxHeight) {
    if (maxHeight >= _tallHeight) return _maxBottomPadding;
    if (maxHeight <= _shortHeight) return _minBottomPadding;

    final t = (maxHeight - _shortHeight) / (_tallHeight - _shortHeight);
    return _minBottomPadding + (_maxBottomPadding - _minBottomPadding) * t;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bottomPadding = _responsiveBottomPadding(constraints.maxHeight);

        return Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPadding),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.emptyWishlist,
                      width: 240,
                      height: 240,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.wishlistEmptyTitle,
                      style: AppTextStyles.headingH2Bold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.wishlistEmptySubtitle,
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
          ),
        );
      },
    );
  }
}
