import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/legal_section.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final l10n = context.l10n;

    return AppScaffold(
      verticalPadding: 12,
      appBar: AppCustomAppBar(title: l10n.termsAndConditionsTitle),
      body: ListView(
        children: [
          Text(l10n.termsOurTerms, style: AppTextStyles.headingH2Bold),
          const SizedBox(height: 6),
          Text(
            l10n.termsIntro,
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
          const SizedBox(height: 24),

          LegalSection(
            number: '1',
            title: l10n.termsSection1Title,
            points: [
              LegalPoint(point: l10n.termsSection1Point1),
              LegalPoint(point: l10n.termsSection1Point2),
              LegalPoint(point: l10n.termsSection1Point3),
            ],
          ),

          LegalSection(
            number: '2',
            title: l10n.termsSection2Title,
            points: [
              LegalPoint(point: l10n.termsSection2Point1),
              LegalPoint(point: l10n.termsSection2Point2),
              LegalPoint(point: l10n.termsSection2Point3),
            ],
          ),

          LegalSection(
            number: '3',
            title: l10n.termsSection3Title,
            points: [
              LegalPoint(point: l10n.termsSection3Point1),
              LegalPoint(point: l10n.termsSection3Point2),
              LegalPoint(point: l10n.termsSection3Point3),
            ],
          ),

          LegalSection(
            number: '4',
            title: l10n.termsSection4Title,
            points: [
              LegalPoint(point: l10n.termsSection4Point1),
              LegalPoint(point: l10n.termsSection4Point2),
              LegalPoint(point: l10n.termsSection4Point3),
            ],
          ),

          LegalSection(
            number: '5',
            title: l10n.termsSection5Title,
            points: [
              LegalPoint(point: l10n.termsSection5Point1),
              LegalPoint(point: l10n.termsSection5Point2),
              LegalPoint(point: l10n.termsSection5Point3),
            ],
          ),

          LegalSection(
            number: '6',
            title: l10n.termsSection6Title,
            points: [
              LegalPoint(point: l10n.termsSection6Point1),
              LegalPoint(point: l10n.termsSection6Point2),
            ],
          ),

          LegalSection(
            number: '7',
            title: l10n.termsSection7Title,
            points: [
              LegalPoint(point: l10n.termsSection7Point1),
              LegalPoint(point: l10n.termsSection7Point2),
            ],
          ),

          LegalSection(
            number: '8',
            title: l10n.termsSection8Title,
            points: [
              LegalPoint(point: l10n.termsSection8Point1),
              LegalPoint(point: l10n.termsSection8Point2),
              LegalPoint(point: l10n.termsSection8Point3),
            ],
          ),

          LegalSection(
            number: '9',
            title: l10n.termsSection9Title,
            points: [
              LegalPoint(point: l10n.termsSection9Point1),
              LegalPoint(point: l10n.termsSection9Point2),
            ],
          ),

          LegalSection(
            number: '10',
            title: l10n.termsSection10Title,
            points: [
              LegalPoint(point: l10n.termsSection10Point1),
              LegalPoint(point: l10n.termsSection10Point2),
            ],
          ),

          Text(
            l10n.termsOutro,
            style: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
        ],
      ),
    );
  }
}
