import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:ecommerce_app/features/checkout/ui/widgets/checkout_process_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutShippingScreen extends StatefulWidget {
  const CheckoutShippingScreen({super.key});

  @override
  State<CheckoutShippingScreen> createState() => _CheckoutShippingScreenState();
}

class _CheckoutShippingScreenState extends State<CheckoutShippingScreen> {
  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();

    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(
          successShipping: () {
            context.pushNamed(RouteNames.checkoutPaymentScreen);
          },
        );
      },
      child: AppScaffold(
        verticalPadding: 12,
        bottomNavigationBar: Padding(
          padding: const .symmetric(vertical: 27, horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              checkoutCubit.onSaveShippingInfo();
            },
            child: const Text('Save'),
          ),
        ),
        appBar: const AppCustomAppBar(title: 'Checkout'),
        body: Form(
          key: checkoutCubit.formKeyShipping,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const CheckoutProcessStepper(
                  currentStep: CheckoutStep.shipping,
                ),
                const SizedBox(height: 24),

                const RequiredLabel('Full Name'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: checkoutCubit.fullNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter full name',
                  ),
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Full name is required';
                    }
                    if (value!.trim().length < 3) {
                      return 'Full name must be at least 3 characters';
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
                      return 'Full name can only contain letters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 12),

                const RequiredLabel('Street Address'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: checkoutCubit.streetAddressController,
                  decoration: const InputDecoration(
                    hintText: 'Enter street address',
                  ),

                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Street address is required';
                    }
                    if (value!.trim().length < 5) {
                      return 'Please enter a more detailed address';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 12),

                const RequiredLabel(
                  'Postal Code (optional)',
                  isRequired: false,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: checkoutCubit.postalCodeController,
                  decoration: const InputDecoration(
                    hintText: 'Enter postal code',
                  ),
                  validator: (value) {
                    if (value.isNullOrEmpty()) return null; // optional field
                    if (!RegExp(r'^\d{4,6}$').hasMatch(value!.trim())) {
                      return 'Enter a valid postal code';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
