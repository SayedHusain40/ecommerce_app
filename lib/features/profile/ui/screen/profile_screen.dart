import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/whatsapp_helper.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/theme/logic/theme_cubit.dart';
import 'package:ecommerce_app/core/widgets/language_tile.dart';
import 'package:ecommerce_app/features/profile/data/model/user_profile_model.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/section_title.dart';
import 'package:ecommerce_app/features/profile/ui/widgets/settings_tile.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfileModel userProfileModel;

  @override
  void initState() {
    super.initState();
    userProfileModel = context.read<ProfileCubit>().userInfo;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.cyan,
        statusBarIconBrightness: Brightness.light, // Android icons
        statusBarBrightness: Brightness.dark, // iOS status bar text/icons
      ),
      child: Scaffold(
        backgroundColor: AppColors.cyan,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(brightness, isRtl),
              Expanded(child: _buildContent(context, brightness)),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader(Brightness brightness, bool isRtl) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 21),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: AppColors.grey50(brightness),
            ),
            child: const Icon(Icons.person),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userProfileModel.name,
                  style: AppTextStyles.button1.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  userProfileModel.email,
                  style: AppTextStyles.button2.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<ProfileCubit>().logout();
            },
            icon: Transform.flip(
              flipX: isRtl,
              child: SvgPicture.asset(AppIcons.logout, width: 32, height: 32),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- CONTENT ----------------
  Widget _buildContent(BuildContext context, Brightness brightness) {
    final l10n = AppLocalizations.of(context)!;

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.blackInDark(brightness),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: ListView(
        children: [
          SectionTitle(l10n.personalInformation),
          SettingsTile(
            icon: Icons.local_shipping_outlined,
            title: l10n.shippingAddress,
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.credit_card_outlined,
            title: l10n.paymentMethod,
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.receipt_long_outlined,
            title: l10n.orderHistory,
            onTap: () {},
          ),
          SectionTitle(l10n.supportAndInformation),
          SettingsTile(
            icon: Icons.verified_user_outlined,
            title: l10n.privacyPolicy,
            onTap: () {
              context.pushNamed(RouteNames.privacyPolicyScreen);
            },
          ),
          SettingsTile(
            icon: Icons.description_outlined,
            title: l10n.termsAndConditions,
            onTap: () {
              context.pushNamed(RouteNames.termsAndConditionsScreen);
            },
          ),
          SettingsTile(
            icon: Icons.help_outline_rounded,
            title: l10n.faqs,
            onTap: () {
              context.pushNamed(RouteNames.faqsScreen);
            },
          ),
          SettingsTile(
            icon: Icons.chat_outlined,
            title: l10n.contactUs,
            onTap: () {
              openWhatsApp(
                phoneNumber: '97337355013',
                message: l10n.whatsappHelpMessage,
              );
            },
          ),
          SectionTitle(l10n.accountManagement),
          SettingsTile(
            icon: Icons.lock_outline_rounded,
            title: l10n.changePassword,
            onTap: () {
              context.pushNamed(RouteNames.verifyOldPasswordScreen);
            },
          ),
          LanguageTile(
            leadingColorIcon: AppColors.grey150Light,
            titleStyle: AppTextStyles.body2Medium.copyWith(
              color: AppColors.grey150(brightness),
            ),
          ),
          Divider(height: 1, thickness: 1, color: AppColors.grey50(brightness)),
          SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: l10n.darkTheme,
            trailing: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return SizedBox(
                  width: 30,
                  child: FittedBox(
                    child: Switch(
                      value: themeMode == ThemeMode.dark,
                      materialTapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // removes extra padding
                      padding: EdgeInsets.zero,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
