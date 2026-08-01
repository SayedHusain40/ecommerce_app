import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
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
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
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
              _buildHeader(),
              Expanded(child: _buildContent()),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 21),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image: NetworkImage('https://i.pravatar.cc/150?img=12'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name',
                  style: AppTextStyles.button1.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  'example@gmail.com',
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
  Widget _buildContent() {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
            title: 'Change Password',
            onTap: () {
              context.pushNamed(RouteNames.verifyOldPasswordScreen);
            },
          ),
          _SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Theme',
            trailing: Switch(
              value: _isDarkTheme,
              activeThumbColor: AppColors.cyan,
              onChanged: (value) {
                setState(() => _isDarkTheme = value);
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
        const Divider(height: 1, thickness: 1, color: AppColors.grey50Light),
      ],
    );
  }
}
