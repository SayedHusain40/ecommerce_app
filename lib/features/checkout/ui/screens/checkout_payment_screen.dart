import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:ecommerce_app/features/checkout/ui/widgets/checkout_process_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPaymentScreen extends StatelessWidget {
  const CheckoutPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();

    return BlocListener<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) => current is SuccessPayment,
      listener: (context, state) {
        state.whenOrNull(
          successPayment: () {
            context.pushNamed(RouteNames.checkoutReviewScreen);
          },
        );
      },
      child: AppScaffold(
        verticalPadding: 12,
        bottomNavigationBar: Padding(
          padding: const .symmetric(vertical: 27, horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              checkoutCubit.onPaymentContinue();
            },
            child: const Text('Continue'),
          ),
        ),
        appBar: AppCustomAppBar(
          title: 'Checkout',
          onBackPressed: () {
            checkoutCubit.resetState();
            context.pop();
          },
        ),
        body: Form(
          key: checkoutCubit.formKeyPayment,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const CheckoutProcessStepper(currentStep: CheckoutStep.payment),

                const SizedBox(height: 24),
                const RequiredLabel('Card Holder Name'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: checkoutCubit.cardHolderNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter card holder name',
                  ),
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Card holder name is required';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                const RequiredLabel('Card Number'),
                const SizedBox(height: 8),
                TextFormField(
                  inputFormatters: [CardNumberFormatter()],
                  decoration: const InputDecoration(
                    hintText: '4111 1111 1111 1111',
                  ),
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Card number is required';
                    }
                    if (value!.length < 13 || value.length > 19) {
                      return 'Enter a valid card number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RequiredLabel('Expiration'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: checkoutCubit.expirationController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [ExpirationDateFormatter()],
                            decoration: const InputDecoration(
                              hintText: 'MM/YYYY',
                            ),
                            validator: (value) {
                              if (value.isNullOrEmpty()) {
                                return 'Expiration date is required';
                              }
                              final parts = value!.split(' / ');
                              if (parts.length != 2) {
                                return 'Enter a valid expiration date';
                              }
                              final month = int.tryParse(parts[0]);
                              final year = int.tryParse(parts[1]);
                              if (month == null || month < 1 || month > 12) {
                                return 'Enter a valid month';
                              }
                              if (year == null || parts[1].length != 4) {
                                return 'Enter a valid year';
                              }

                              final now = DateTime.now();
                              final isExpired =
                                  year < now.year ||
                                  (year == now.year && month < now.month);
                              if (isExpired) {
                                return 'Card has expired';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RequiredLabel('CVV'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: checkoutCubit.cvvController,
                            keyboardType: TextInputType.number,

                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: const InputDecoration(hintText: '123'),
                            validator: (value) {
                              if (value.isNullOrEmpty()) {
                                return 'CVV is required';
                              }
                              if (value!.length < 3 || value.length > 4) {
                                return 'Enter a valid CVV';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final isDeleted = newValue.text.length < oldValue.text.length;

    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    String formattedText = digits;

    // cut
    // formattedText = digits.length > 19
    //     ? formattedText.substring(0, 19 + 4) // 4 is spaces
    //     : formattedText;

    // 1234 5678 9000 0000
    // 0123 456789

    if (digits.length >= 5) {
      formattedText =
          '${digits.substring(0, 4)} ${digits.substring(4, digits.length > 8 ? 8 : digits.length)}';
    }

    if (digits.length >= 9) {
      formattedText =
          '$formattedText ${digits.substring(8, digits.length > 12 ? 12 : digits.length)}';
    }
    if (digits.length >= 13) {
      formattedText =
          '$formattedText ${digits.substring(12, digits.length > 16 ? 16 : digits.length)}';
    }

    return TextEditingValue(
      text: formattedText,

      selection: TextSelection.collapsed(
        offset: isDeleted
            ? newValue.selection.baseOffset
            : formattedText.length,
      ),
    );
  }
}

class ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final isDeleted = newValue.text.length < oldValue.text.length;

    String currentValue = newValue.text;

    // When field is full, just ignore new typing (still allow replacing a selection).
    if (oldValue.text.length == 9 &&
        !isDeleted &&
        oldValue.selection.isCollapsed) {
      return TextEditingValue(
        text: oldValue.text,
        selection: TextSelection.collapsed(
          offset: oldValue.selection.baseOffset,
        ),
      );
    }

    // ==== Delete Process ==========
    if (isDeleted) {
      final hasYear = oldValue.text.length > 5;

      // when deleting right after month, no year yet. Ex: "12 / |" -> drop to 1 digit.
      if (oldValue.selection.baseOffset == 5 && !hasYear) {
        currentValue = newValue.text[0];

        // When Deleting month and year exit
      } else if ((oldValue.selection.baseOffset == 1 ||
              oldValue.selection.baseOffset == 2) &&
          hasYear) {
        // Deleting inside a full 2-digit month -> keep year, shrink month to 1 digit.
        if (oldValue.text.contains('/')) {
          final parts = oldValue.text.split(' / ');
          final month = parts[0];
          final year = parts.length > 1 ? parts[1] : '';

          if (month.length == 2) {
            final newText = '${currentValue[0]} / $year';
            return TextEditingValue(
              text: newText,
              selection: const TextSelection.collapsed(offset: 1), // after "1"
            );
          }
          // month.length == 1: handled later, nothing to do here
        }
      }
    }

    // 1. Extract digits only, capped at 6 (MMYYYY).
    var digits = currentValue.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 6) digits = digits.substring(0, 6);

    // Guard the empty case, fix throws RangeError in else .
    if (digits.isEmpty) {
      return const TextEditingValue(text: '');
    }

    String formatted;
    if (digits.length == 1) {
      formatted = int.parse(digits) > 1 ? '0$digits / ' : digits;
    } else if (digits.length == 2) {
      formatted = '$digits / ';
    } else {
      formatted = '${digits.substring(0, 2)} / ${digits.substring(2)}';
    }

    // ==== cursor position ============

    // If deleting near "MM / " (positions 3,4,5 = around the " / " part),
    // put cursor at the end of new text.
    // Example: "12 / " -> delete -> cursor goes to end, not stuck in middle.
    const separatorOffsets = {3, 4, 5};
    final nearSeparator =
        separatorOffsets.contains(oldValue.selection.baseOffset) &&
        oldValue.text.length >= 5;

    int rawOffset;
    if (isDeleted) {
      if (nearSeparator) {
        // Near " / " -> cursor to end. Example: "12 / 3" delete -> "12 / "
        rawOffset = formatted.length;
      } else {
        // Elsewhere -> keep Flutter's cursor. Example: "12 / 34|56" delete "4" -> "12 / 3|56"
        rawOffset = newValue.selection.extentOffset;
      }
    } else {
      // We're typing/adding a character.
      if (formatted.length == 5) {
        // Month just finished -> cursor to end. Example: type "2" -> "02 / |"
        rawOffset = formatted.length;
      } else {
        // Normal typing -> keep Flutter's cursor.
        rawOffset = newValue.selection.extentOffset;
      }
    }

    // Cursor can never go past the text end.
    // Example: text = "1" (length 1), cursor can't be at 4 -> clamp to 1.
    final offset = rawOffset.clamp(0, formatted.length);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
