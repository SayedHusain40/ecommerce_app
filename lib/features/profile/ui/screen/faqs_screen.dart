import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/faq_item.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: const AppCustomAppBar(title: 'FAQs'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: [
          const FaqItem(
            question: 'Can I cancel my order?',
            answer:
                'Yes only if the order is not dispatched yet. You can '
                'contact our customer service department to get your order '
                'canceled.',
          ),

          const FaqItem(
            question: 'Will I receive the same product I see in the photo?',
            answer:
                'Actual product color may vary from the images shown. '
                'Every monitor or mobile display has a different capability '
                'to display colors, and every individual may see these '
                'colors differently. In addition, lighting conditions at '
                'the time the photo was taken can also affect an image\'s '
                'color.',
          ),

          const FaqItem(
            question: 'How can I recover the forgotten password?',
            answer:
                'If you have forgotten your password, you can recover '
                'it from "Login - Forgotten your password?" section. You '
                'will receive an e-mail with a link to enter and confirm '
                'your new password.',
          ),

          const FaqItem(
            question: 'Is my personal information confidential?',
            answer:
                'Your personal information is confidential. We do not '
                'rent, sell, barter or trade email addresses. When you '
                'place an order with us, we collect your name, address, '
                'telephone number, credit card information and your email '
                'address. We use this information to fulfill your order '
                'and to communicate with you about your order. All your '
                'information is kept confidential and will not be '
                'disclosed to anybody unless ordered by government '
                'authorities.',
          ),

          const FaqItem(
            question: 'What payment methods can I use to make purchases?',
            answer:
                'We offer the following payment methods: PayPal, VISA, '
                'MasterCard and Voucher code, if applicable.',
          ),

          const SizedBox(height: 12),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.body3Regular.copyWith(
                  color: AppColors.whiteInDark(brightness),
                ),
                children: [
                  const TextSpan(
                    text: 'For any query, you can visit our website for ',
                  ),
                  TextSpan(
                    text: 'Help Center',
                    style: AppTextStyles.body3SemiBold.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                  const TextSpan(text: ' at Quickmart.com'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
