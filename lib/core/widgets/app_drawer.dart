import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/helpers/whatsapp_helper.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/logic/theme_cubit.dart';
import 'package:ecommerce_app/core/widgets/drawer_menu_tile.dart';
import 'package:ecommerce_app/core/widgets/language_tile.dart';
import 'package:ecommerce_app/core/widgets/settings_expansion_tile.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_vertical_list.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = context.isRtl;
    final brightness = context.brightness;
    final isDark = context.isRtl;
    final l10n = context.l10n;

    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.blackInDark(brightness),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isRtl ? 24 : 0),
            topRight: Radius.circular(isRtl ? 0 : 24),
          ),
        ),

        child: Column(
          children: [
            // Header
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              minTileHeight: 50,
              leading: SvgPicture.asset(AppImages.logo(brightness), width: 120),
              title: const SizedBox.shrink(),
              trailing: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  AppIcons.cancel(brightness),
                  width: 20,
                  height: 20,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      height: 1,
                      color: AppColors.grey50(brightness),
                    ),
                  ),
                  SettingsExpansionTile(
                    tilePadding: 20,
                    childrenPaddingHorizontal: 0,
                    childrenPaddingVertical: 0,
                    minTileHeight: 64,
                    title: l10n.categories,
                    leadingColor: AppColors.grey150(brightness),
                    leading: SvgPicture.asset(
                      AppIcons.inactiveCategory(brightness),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 1,
                          color: AppColors.grey50(brightness),
                        ),
                      ),
                      const CategoryVerticalList(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      height: 1,
                      color: AppColors.grey50(brightness),
                    ),
                  ),
                  DrawerMenuTile(
                    icon: SvgPicture.asset(
                      AppIcons.inactiveShoppingCart(brightness),
                    ),
                    title: l10n.cart,
                    onTap: () {
                      context.pop();
                      context.read<NavCubit>().changeNav(selectedNav: 3);
                    },
                  ),
                  DrawerMenuTile(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 24,
                      color: AppColors.grey150(brightness),
                    ),
                    title: l10n.settings,
                    onTap: () {
                      context.pop();
                      context.read<NavCubit>().changeNav(selectedNav: 4);
                    },
                  ),
                  DrawerMenuTile(
                    icon: SvgPicture.asset(AppIcons.orderHistory(brightness)),
                    title: l10n.orders,
                    onTap: () {},
                  ),
                  DrawerMenuTile(
                    icon: SvgPicture.asset(
                      AppIcons.whatsApp,
                      width: 24,
                      height: 24,
                    ),
                    title: l10n.contactUs,
                    onTap: () {
                      openWhatsApp(
                        phoneNumber: '97337355013',
                        message: AppLocalizations.of(
                          context,
                        )!.whatsappHelpMessage,
                      );
                    },
                  ),
                  LanguageTile(
                    tilePadding: 20,
                    childrenPadding: 20,
                    minTileHeight: 64,
                    leadingColorIcon: AppColors.grey150(brightness),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      height: 1,
                      color: AppColors.grey50(brightness),
                    ),
                  ),
                  DrawerMenuTile(
                    icon: SvgPicture.asset(
                      AppIcons.theme(brightness),
                      width: 24,
                      height: 24,
                    ),
                    title: l10n.darkTheme,
                    trailing: SizedBox(
                      width: 45,
                      child: FittedBox(
                        child: Switch(
                          value: isDark,
                          onChanged: (_) {
                            context.read<ThemeCubit>().toggleTheme();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
