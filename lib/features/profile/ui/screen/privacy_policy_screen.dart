import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/legal_section.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: const AppCustomAppBar(title: 'Privacy Policy'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: [
          Text('Our Policy', style: AppTextStyles.headingH2Bold),
          const SizedBox(height: 6),
          Text(
            'At QuickMart, we are committed to protecting the privacy and '
            'security of our users\' personal information. This Privacy '
            'Policy outlines how we collect, use, disclose, and safeguard '
            'the information obtained through our e-commerce app. By using '
            'QuickMart, you consent to the practices described in this policy.',
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness)
            ),
          ),
          const SizedBox(height: 24),

          const LegalSection(
            number: '1',
            title: 'Information Collection',
            points: [
              LegalPoint(
                point:
                    'We may collect personal information such as name, address, '
                    'email, and phone number when you create an account, make a '
                    'purchase, or interact with our services.',
              ),
              LegalPoint(
                point:
                    'We collect information related to your purchases, including '
                    'order history, payment method, and shipping details.',
              ),
              LegalPoint(
                point:
                    'We may collect data on how you interact with our app, such '
                    'as browsing activity, search queries, and preferences.',
              ),
            ],
          ),

          const LegalSection(
            number: '2',
            title: 'Information Use',
            points: [
              LegalPoint(
                point:
                    'We use the collected information to process orders, deliver '
                    'products, and provide customer support.',
              ),
              LegalPoint(
                point:
                    'We may use your information to personalize your shopping '
                    'experience, recommend products, and display targeted '
                    'advertisements.',
              ),
              LegalPoint(
                point:
                    'We may use your contact information to send important '
                    'updates, promotional offers, and newsletters. You can '
                    'opt-out of these communications at any time.',
              ),
            ],
          ),

          const LegalSection(
            number: '3',
            title: 'Information Sharing',
            points: [
              LegalPoint(
                point:
                    'We may share your information with trusted third-party '
                    'service providers who assist us in operating our app, '
                    'fulfilling orders, and improving our services.',
              ),
              LegalPoint(
                point:
                    'We may disclose personal information if required by law or '
                    'in response to a valid legal request from authorities.',
              ),
            ],
          ),

          const LegalSection(
            number: '4',
            title: 'Data Security',
            points: [
              LegalPoint(
                point:
                    'We implement appropriate security measures to protect your '
                    'information from unauthorized access, alteration, '
                    'disclosure, or destruction.',
              ),
              LegalPoint(
                point:
                    'However, please note that no data transmission over the '
                    'internet or electronic storage is 100% secure. We cannot '
                    'guarantee absolute security of your information.',
              ),
            ],
          ),

          const LegalSection(
            number: '5',
            title: 'User Rights',
            points: [
              LegalPoint(
                point:
                    'You have the right to access, correct, or update your '
                    'personal information stored in our app.',
              ),
              LegalPoint(
                point:
                    'We retain your personal information as long as necessary '
                    'to provide our services and comply with legal obligations.',
              ),
            ],
          ),

          const LegalSection(
            number: '6',
            title: 'Children\'s Privacy',
            points: [
              LegalPoint(
                point:
                    'QuickMart is not intended for children under the age of 13. '
                    'We do not knowingly collect or solicit personal information '
                    'from children.',
              ),
            ],
          ),

          const LegalSection(
            number: '7',
            title: 'Updates to the Privacy Policy',
            points: [
              LegalPoint(
                point:
                    'We reserve the right to update this Privacy Policy from '
                    'time to time. Any changes will be posted on our app, and '
                    'the revised policy will be effective upon posting.',
              ),
            ],
          ),

          Text(
            'If you have any questions or concerns about our Privacy Policy, '
            'please contact our customer support. By using QuickMart, you '
            'acknowledge that you have read and understood this Privacy '
            'Policy and agree to its terms and conditions.',
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
        ],
      ),
    );
  }
}
