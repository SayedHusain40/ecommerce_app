import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  width: double.infinity,
                  height: 408,
                  alignment: Alignment
                      .center, // <-- this stops it from force-filling the child
                  decoration: BoxDecoration(
                    borderRadius: .circular(32),
                    color: AppColors.cyan50(brightness),
                  ),
                  child: Image.asset(
                    AppImages.newPasswordSetSuccessfully,
                    width: 245,
                    fit: .contain,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'New password set successfully',
                  textAlign: TextAlign.center,

                  style: AppTextStyles.headingH2Bold,
                ),
                const SizedBox(height: 16),
                Text(
                  'Congratulations! Your password has been set successfully. Please proceed to the login screen to verify your account.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body2Regular.copyWith(
                    color: AppColors.grey150(brightness),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamedAndRemoveUntil(
                      RouteNames.appAuthState,
                      predicate: (route) => false,
                    );
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
