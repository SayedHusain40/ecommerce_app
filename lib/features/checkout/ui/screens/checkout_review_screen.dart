import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:ecommerce_app/features/checkout/ui/widgets/checkout_process_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutReviewScreen extends StatelessWidget {
  const CheckoutReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();
    final orderList = checkoutCubit.ordersList;
    final totalQuantity = checkoutCubit.totalQuantity;
    final brightness = context.brightness;
    final l10n = context.l10n;

    final regularStyle = AppTextStyles.body3Regular.copyWith(
      color: AppColors.grey150(brightness),
    );

    return BlocListener<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) => current is SuccessReview,
      listener: (context, state) {
        state.whenOrNull(
          successReview: () {
            context.pushNamed(RouteNames.orderSuccessScreen);
          },
        );
      },
      child: AppScaffold(
        applyPadding: false,
        verticalPadding: 12,
        appBar: const AppCustomAppBar(title: 'Checkout'),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              checkoutCubit.saveOrder();
            },
            child: const Text('Place Order'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CheckoutProcessStepper(currentStep: CheckoutStep.review),
            const SizedBox(height: 24),

            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                context.pushNamed(
                  RouteNames.checkoutReviewItemsScreen,
                  arguments: orderList,
                );
              },
              child: Container(
                height: 56,
                padding: const .symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.grey50(brightness),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      'Items ($totalQuantity)',
                      style: AppTextStyles.body2Medium,
                    ),
                    SvgPicture.asset(
                      AppIcons.arrowRight,
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const .symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Shipping Address', style: AppTextStyles.body1Medium),
                  const SizedBox(height: 12),

                  _InfoRow(
                    label: 'Full Name',
                    value: checkoutCubit.fullNameController.text,
                    labelStyle: regularStyle,
                    valueStyle: regularStyle,
                  ),
                  _InfoRow(
                    label: 'Street Address',
                    value: checkoutCubit.streetAddressController.text,
                    labelStyle: regularStyle,
                    valueStyle: regularStyle,
                  ),
                  _InfoRow(
                    label: 'Postal Code',
                    value: checkoutCubit.postalCodeController?.text ?? '-',
                    labelStyle: regularStyle,
                    valueStyle: regularStyle,
                  ),

                  const SizedBox(height: 16),
                  Text(l10n.orderInfo, style: AppTextStyles.body1Medium),
                  const SizedBox(height: 12),

                  _InfoRow(
                    label: l10n.subtotal,
                    value: '\$${checkoutCubit.totalOrder}',
                    labelStyle: regularStyle,
                    valueStyle: regularStyle,
                  ),
                  _InfoRow(
                    label: l10n.shippingCost,
                    value: '\$0.00',
                    labelStyle: regularStyle,
                    valueStyle: regularStyle,
                  ),
                  _InfoRow(
                    label: l10n.total,
                    value: '\$${checkoutCubit.totalOrder}',
                    labelStyle: AppTextStyles.body1Medium,
                    valueStyle: AppTextStyles.body1Medium,
                    height: 42,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final double height;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
    this.height = 32,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
