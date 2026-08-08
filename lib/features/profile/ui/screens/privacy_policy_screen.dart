import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/legal_section.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppCustomAppBar(title: l10n.privacyPolicyTitle),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: [
          Text(l10n.privacyOurPolicy, style: AppTextStyles.headingH2Bold),
          const SizedBox(height: 6),
          Text(
            l10n.privacyIntro,
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
          const SizedBox(height: 24),

          LegalSection(
            number: '1',
            title: l10n.privacySection1Title,
            points: [
              LegalPoint(point: l10n.privacySection1Point1),
              LegalPoint(point: l10n.privacySection1Point2),
              LegalPoint(point: l10n.privacySection1Point3),
            ],
          ),

          LegalSection(
            number: '2',
            title: l10n.privacySection2Title,
            points: [
              LegalPoint(point: l10n.privacySection2Point1),
              LegalPoint(point: l10n.privacySection2Point2),
              LegalPoint(point: l10n.privacySection2Point3),
            ],
          ),

          LegalSection(
            number: '3',
            title: l10n.privacySection3Title,
            points: [
              LegalPoint(point: l10n.privacySection3Point1),
              LegalPoint(point: l10n.privacySection3Point2),
            ],
          ),

          LegalSection(
            number: '4',
            title: l10n.privacySection4Title,
            points: [
              LegalPoint(point: l10n.privacySection4Point1),
              LegalPoint(point: l10n.privacySection4Point2),
            ],
          ),

          LegalSection(
            number: '5',
            title: l10n.privacySection5Title,
            points: [
              LegalPoint(point: l10n.privacySection5Point1),
              LegalPoint(point: l10n.privacySection5Point2),
            ],
          ),

          LegalSection(
            number: '6',
            title: l10n.privacySection6Title,
            points: [LegalPoint(point: l10n.privacySection6Point1)],
          ),

          LegalSection(
            number: '7',
            title: l10n.privacySection7Title,
            points: [LegalPoint(point: l10n.privacySection7Point1)],
          ),

          Text(
            l10n.privacyOutro,
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
        ],
      ),
    );
  }
}
