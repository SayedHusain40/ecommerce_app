import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/localization/logic/locale_cubit.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/theme/logic/theme_cubit.dart';
import 'package:ecommerce_app/features/profile/data/model/user_profile_model.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
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
              _buildHeader(brightness),
              Expanded(child: _buildContent(context, brightness)),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader(Brightness brightness) {
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
            icon: SvgPicture.asset(AppIcons.logout, width: 32, height: 32),
          ),
        ],
      ),
    );
  }

  // ---------------- WHITE CONTENT CARD ----------------
  Widget _buildContent(BuildContext context, Brightness brightness) {
    final themeMode = context.watch<ThemeCubit>().state;
    final isDark = themeMode == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.linear, // match AnimatedTheme's default curve
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isDark ? AppColors.black : AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: ListView(
        children: [
          const _SectionTitle('Personal Information'),
          _SettingsTile(
            icon: Icons.local_shipping_outlined,
            title: 'Shipping Address',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.credit_card_outlined,
            title: 'Payment Method',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.receipt_long_outlined,
            title: 'Order History',
            onTap: () {},
          ),
          const _SectionTitle('Support & Information'),
          _SettingsTile(
            icon: Icons.verified_user_outlined,
            title: 'Privacy Policy',
            onTap: () {
              context.pushNamed(RouteNames.privacyPolicyScreen);
            },
          ),
          _SettingsTile(
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            onTap: () {
              context.pushNamed(RouteNames.termsAndConditionsScreen);
            },
          ),
          _SettingsTile(
            icon: Icons.help_outline_rounded,
            title: 'FAQs',
            onTap: () {
              context.pushNamed(RouteNames.faqsScreen);
            },
          ),
          const _SectionTitle('Account Management'),
          _SettingsTile(
            icon: Icons.lock_outline_rounded,
            title: l10n.changePassword,
            onTap: () {
              context.pushNamed(RouteNames.verifyOldPasswordScreen);
            },
          ),
          const LanguageTile(),
          Divider(height: 1, thickness: 1, color: AppColors.grey50(brightness)),

          _SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: l10n.darkTheme,
            trailing: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return Switch(
                  value: themeMode == ThemeMode.dark,
                  activeThumbColor: AppColors.cyan,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- REUSABLE WIDGETS ----------------
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: AppTextStyles.body3SemiBold.copyWith(
          color: AppColors.whiteInDark(brightness),
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, weight: 24, color: AppColors.grey150Light),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.body2Medium.copyWith(
                        color: AppColors.grey150(brightness),
                      ),
                    ),
                  ),
                  trailing ?? SvgPicture.asset(AppIcons.arrowRightSmall),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1, thickness: 1, color: AppColors.grey50(brightness)),
      ],
    );
  }
}

class LanguageTile extends StatefulWidget {
  const LanguageTile({super.key});

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  bool isExpanded = false;
  bool isEnglishSelected = true;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: ExpansionTile(
        minTileHeight: 48,
        splashColor: Colors.transparent,

        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,

        shape: const Border(),
        collapsedShape: const Border(),

        leading: const Icon(Icons.translate, color: AppColors.grey150Light),

        title: Text(
          'data',
          style: AppTextStyles.body2Medium.copyWith(
            color: AppColors.grey150(brightness),
          ),
        ),

        tilePadding: const EdgeInsets.symmetric(horizontal: 16),

        childrenPadding: const EdgeInsets.symmetric(vertical: 16),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(isEnglishSelected ? 'English' : 'ألعربية'),
            const SizedBox(width: 10),

            AnimatedRotation(
              turns: isExpanded ? 0.25 : 0,
              duration: const Duration(milliseconds: 200),
              child: SvgPicture.asset(AppIcons.arrowRightSmall),
            ),
          ],
        ),

        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                LanguageOption(
                  language: 'English',
                  flag: AppImages.usFlag,
                  isSelected: isEnglishSelected,
                  onTap: () {
                    isEnglishSelected = true;
                    context.read<LocaleCubit>().changeLocale(
                      const Locale('en'),
                    );
                  },
                ),

                const SizedBox(height: 10),

                LanguageOption(
                  language: 'العربية',
                  flag: AppImages.saFlag,
                  isSelected: isEnglishSelected == false,
                  onTap: () {
                    isEnglishSelected = false;
                    context.read<LocaleCubit>().changeLocale(
                      const Locale('ar'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String language;
  final String flag;
  final bool isSelected;
  final VoidCallback? onTap;

  const LanguageOption({
    super.key,
    required this.language,
    required this.flag,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? isDark
                  ? const Color(0xFF1B2829)
                  : const Color(0xFFEDF7EE)
            : isDark
            ? const Color(0xFF1D2533)
            : const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey50(brightness)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        minTileHeight: 50,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: 50,
            height: 30,
            child: Image.asset(flag, fit: BoxFit.cover),
          ),
        ),
        title: Text(
          language,
          style: AppTextStyles.body1Medium.copyWith(
            color: AppColors.whiteInDark(brightness),
          ),
        ),

        trailing: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.green : AppColors.grey150(brightness),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.check,
            size: 18,
            color: isSelected
                ? Colors.green
                : AppColors.whiteInDark(brightness),
          ),
        ),
      ),
    );
  }
}
