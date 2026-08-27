import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum CheckoutStep { shipping, payment, review }

class CheckoutProcessStepper extends StatelessWidget {
  final CheckoutStep currentStep;

  const CheckoutProcessStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;

    return Row(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        _item(brightness, CheckoutStep.shipping, 'Shipping', AppIcons.shipping),
        _divider(),
        _item(brightness, CheckoutStep.payment, 'Payment', AppIcons.payment),
        _divider(),
        _item(brightness, CheckoutStep.review, 'Review', AppIcons.review),
      ],
    );
  }

  Widget _divider() => const Row(
    children: [
      SizedBox(width: 9),
      SizedBox(
        width: 48,
        child: Divider(thickness: 1, color: AppColors.grey100),
      ),
      SizedBox(width: 9),
    ],
  );

  Widget _item(
    Brightness brightness,
    CheckoutStep step,
    String label,
    String Function(Brightness, {required bool isCurrent, required bool isDone})
    iconBuilder,
  ) {
    final isCurrent = step == currentStep;
    final isDone = step.index < currentStep.index;

    Color? color;
    if (isDone) {
      color = AppColors.cyan;
    } else if (!isDone && !isCurrent) {
      color = AppColors.grey150(brightness);
    }

    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        SvgPicture.asset(
          iconBuilder(brightness, isCurrent: isCurrent, isDone: isDone),
          width: 24,
          height: 24,
        ),
        Text(
          label,
          style: AppTextStyles.body3SemiBold.copyWith(color: color),
          textAlign: .center,
        ),
      ],
    );
  }
}
