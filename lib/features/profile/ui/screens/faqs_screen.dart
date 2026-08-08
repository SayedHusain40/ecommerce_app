import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/faq_item.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppCustomAppBar(title: l10n.faqs),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: [
          FaqItem(
            question: l10n.faqCancelOrderQuestion,
            answer: l10n.faqCancelOrderAnswer,
          ),

          FaqItem(
            question: l10n.faqSameProductQuestion,
            answer: l10n.faqSameProductAnswer,
          ),

          FaqItem(
            question: l10n.faqForgotPasswordQuestion,
            answer: l10n.faqForgotPasswordAnswer,
          ),

          FaqItem(
            question: l10n.faqPersonalInfoQuestion,
            answer: l10n.faqPersonalInfoAnswer,
          ),

          FaqItem(
            question: l10n.faqPaymentMethodsQuestion,
            answer: l10n.faqPaymentMethodsAnswer,
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
                  TextSpan(text: l10n.helpCenterPrefix),
                  TextSpan(
                    text: l10n.helpCenter,
                    style: AppTextStyles.body3SemiBold.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                  TextSpan(text: l10n.helpCenterSuffix),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
