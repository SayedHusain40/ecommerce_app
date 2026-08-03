import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/legal_section.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: const AppCustomAppBar(title: 'Terms & Conditions'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: [
          Text('Our Terms', style: AppTextStyles.headingH2Bold),
          const SizedBox(height: 6),
          Text(
            'Welcome to QuickMart! These Terms and Conditions ("Terms") '
            'govern your use of our e-commerce app. By accessing or using '
            'QuickMart, you agree to be bound by these Terms. Please read '
            'them carefully before proceeding.',
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
          const SizedBox(height: 24),

          const LegalSection(
            number: '1',
            title: 'Account Registration',
            points: [
              LegalPoint(
                point:
                    'You must create an account to use certain features '
                    'of QuickMart.',
              ),
              LegalPoint(
                point:
                    'You are responsible for providing accurate and '
                    'up-to-date information during the registration process.',
              ),
              LegalPoint(
                point:
                    'You must safeguard your account credentials and '
                    'notify us immediately of any unauthorized access or use '
                    'of your account.',
              ),
            ],
          ),

          const LegalSection(
            number: '2',
            title: 'Product Information and Pricing',
            points: [
              LegalPoint(
                point:
                    'QuickMart strives to provide accurate product '
                    'descriptions, images, and pricing information.',
              ),
              LegalPoint(
                point:
                    'We reserve the right to modify product details and '
                    'prices without prior notice.',
              ),
              LegalPoint(
                point:
                    'In the event of an error, we may cancel or refuse '
                    'orders placed for incorrectly priced products.',
              ),
            ],
          ),

          const LegalSection(
            number: '3',
            title: 'Order Placement and Fulfillment',
            points: [
              LegalPoint(
                point:
                    'By placing an order on QuickMart, you agree to '
                    'purchase the selected products at the stated price.',
              ),
              LegalPoint(
                point:
                    'We reserve the right to accept or reject any order, '
                    'and we may cancel orders due to product unavailability, '
                    'pricing errors, or suspected fraudulent activity.',
              ),
              LegalPoint(
                point:
                    'Once an order is confirmed, we will make reasonable '
                    'efforts to fulfill and deliver it in a timely manner.',
              ),
            ],
          ),

          const LegalSection(
            number: '4',
            title: 'Payment',
            points: [
              LegalPoint(
                point:
                    'QuickMart supports various payment methods, '
                    'including credit/debit cards and online payment '
                    'platforms.',
              ),
              LegalPoint(
                point:
                    'By providing payment information, you represent and '
                    'warrant that you are authorized to use the chosen '
                    'payment method.',
              ),
              LegalPoint(
                point:
                    'All payments are subject to verification and '
                    'approval by relevant financial institutions.',
              ),
            ],
          ),

          const LegalSection(
            number: '5',
            title: 'Shipping and Delivery',
            points: [
              LegalPoint(
                point:
                    'QuickMart will make reasonable efforts to ensure '
                    'timely delivery of products.',
              ),
              LegalPoint(
                point:
                    'Shipping times may vary based on factors beyond our '
                    'control, such as location, weather conditions, or '
                    'carrier delays.',
              ),
              LegalPoint(
                point:
                    'Risk of loss or damage to products passes to you '
                    'upon delivery.',
              ),
            ],
          ),

          const LegalSection(
            number: '6',
            title: 'Returns and Refunds',
            points: [
              LegalPoint(
                point:
                    'QuickMart\'s return and refund policies are '
                    'outlined separately and govern the process for '
                    'returning products and seeking refunds.',
              ),
              LegalPoint(
                point:
                    'Certain products may be non-returnable or subject '
                    'to specific conditions.',
              ),
            ],
          ),

          const LegalSection(
            number: '7',
            title: 'Intellectual Property',
            points: [
              LegalPoint(
                point:
                    'QuickMart and its content, including logos, '
                    'trademarks, text, images, and software, are protected '
                    'by intellectual property rights.',
              ),
              LegalPoint(
                point:
                    'You may not use, reproduce, modify, distribute, or '
                    'display any part of QuickMart without our prior '
                    'written consent.',
              ),
            ],
          ),

          const LegalSection(
            number: '8',
            title: 'User Conduct',
            points: [
              LegalPoint(
                point:
                    'You agree to use QuickMart in compliance with '
                    'applicable laws and regulations.',
              ),
              LegalPoint(
                point:
                    'You will not engage in any activity that disrupts '
                    'or interferes with the functioning of QuickMart or '
                    'infringes upon the rights of others.',
              ),
              LegalPoint(
                point:
                    'Any unauthorized use or attempt to access '
                    'restricted areas or user accounts is strictly '
                    'prohibited.',
              ),
            ],
          ),

          const LegalSection(
            number: '9',
            title: 'Limitation of Liability',
            points: [
              LegalPoint(
                point:
                    'QuickMart and its affiliates shall not be liable '
                    'for any direct, indirect, incidental, consequential, '
                    'or punitive damages arising from the use or inability '
                    'to use our app or any products purchased through it.',
              ),
              LegalPoint(
                point:
                    'We do not guarantee the accuracy, completeness, or '
                    'reliability of information provided on QuickMart.',
              ),
            ],
          ),

          const LegalSection(
            number: '10',
            title: 'Governing Law',
            points: [
              LegalPoint(
                point:
                    'These Terms shall be governed by and construed in '
                    'accordance with the laws of [Jurisdiction].',
              ),
              LegalPoint(
                point:
                    'Any disputes arising out of or relating to these '
                    'Terms shall be resolved in the courts of '
                    '[Jurisdiction].',
              ),
            ],
          ),

          Text(
            'If you have any questions or concerns regarding these Terms '
            'and Conditions, please contact our customer support. By using '
            'QuickMart, you acknowledge that you have read, understood, '
            'and agreed to these Terms and Conditions.',
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
        ],
      ),
    );
  }
}
