import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/localization/logic/locale_cubit.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/settings_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageTile extends StatefulWidget {
  final double tilePadding;
  final double childrenPadding;
  final double minTileHeight;
  final Color? leadingColorIcon;
  final TextStyle? titleStyle;
  LanguageTile({
    super.key,
    this.tilePadding = 16,
    this.childrenPadding = 16,
    this.minTileHeight = 48,
    this.leadingColorIcon,
    TextStyle? titleStyle,
  }) : titleStyle = titleStyle ?? AppTextStyles.body2Medium;

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  bool isExpanded = false;
  late bool isEnglishSelected;

  @override
  void initState() {
    super.initState();

    final languageCode =
        getIt<SharedPreferences>().getString(StorageKeys.languageCode) ?? 'en';
    isEnglishSelected = languageCode == 'en';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: SettingsExpansionTile(
          title: l10n.language,
          leading: Icon(Icons.language, color: widget.leadingColorIcon),
          trailingText: l10n.languageName,
          tilePadding: widget.tilePadding,
          childrenPaddingHorizontal: widget.childrenPadding,
          minTileHeight: widget.minTileHeight,
          titleStyle: widget.titleStyle,
          children: [
            Column(
              children: [
                LanguageOption(
                  language: 'English',
                  flag: AppImages.usFlag,
                  isSelected: isEnglishSelected,
                  onTap: () {
                    setState(() {
                      isEnglishSelected = true;
                    });

                    context.read<LocaleCubit>().changeLocale(
                      const Locale('en'),
                    );
                  },
                ),
                const SizedBox(height: 10),
                LanguageOption(
                  language: 'العربية',
                  flag: AppImages.saFlag,
                  isSelected: !isEnglishSelected,
                  onTap: () {
                    setState(() {
                      isEnglishSelected = false;
                    });

                    context.read<LocaleCubit>().changeLocale(
                      const Locale('ar'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
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
    final brightness = context.brightness;
    final isDark = context.isRtl;

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
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          minTileHeight: 50,
          leading: Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(borderRadius: .circular(6)),
            child: Image.asset(flag, fit: BoxFit.cover),
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
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isSelected
                    ? Colors.green
                    : AppColors.grey150(brightness),
                width: 1,
              ),
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
      ),
    );
  }
}
