import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final l10n = context.l10n;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------------- IMAGE CONTAINER ----------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              height: 408,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cyan50(brightness),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  // ---------------- IMAGE ----------------
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        AppImages.orderSuccess,
                        width: 240,
                        height: 240,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ---------------- TITLE ----------------
            Text(
              'Your order has been placed successfully',
              style: AppTextStyles.headingH2Bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // ---------------- DESCRIPTION ----------------
            Text(
              'Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!',
              style: AppTextStyles.body2Regular,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // ---------------- BUTTON ----------------
            ElevatedButton(
              onPressed: () {
                context.read<NavCubit>().changeNav(selectedNav: 0);
                context.pushNamedAndRemoveUntil(
                  RouteNames.appAuthState,
                  predicate: (route) => false,
                );
              },
              child: const Text('Continue Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}
