import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppCustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.elevation,
    this.onBackPressed,
    this.actions,
    this.centerTitle = false,
    this.bottom,
    this.addLine = true,
    this.systemOverlayStyle,
    this.flexibleSpace,
    this.preferredHeight,
    this.showBackButton = true,
    this.logo = false,
  });

  final String? title;
  final Color? backgroundColor;
  final double? elevation;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final bool addLine;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Widget? flexibleSpace;
  final double? preferredHeight;
  final bool showBackButton;
  final bool logo;

  @override
  Size get preferredSize => Size.fromHeight(
    preferredHeight ?? kToolbarHeight + (bottom?.preferredSize.height ?? 0),
  );

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final isRtl = context.isRtl;

    return AppBar(
      elevation: elevation,
      scrolledUnderElevation: 0,
      flexibleSpace: flexibleSpace,
      systemOverlayStyle: systemOverlayStyle,
      title: title != null
          ? Text(title!, style: AppTextStyles.body2Medium)
          : logo
          ? SvgPicture.asset(AppImages.logo(brightness))
          : null,
      centerTitle: centerTitle,
      actions: actions,
      actionsPadding: const EdgeInsetsDirectional.only(end: 16),
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: true,
      bottom: addLine
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(height: 1, color: AppColors.grey50(brightness)),
            )
          : null,
      leading: showBackButton
          ? IconButton(
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              icon: Transform.flip(
                flipX: isRtl,
                child: SvgPicture.asset(AppIcons.arrowLeft(brightness)),
              ),
            )
          : null,
      titleSpacing: showBackButton ? 0 : NavigationToolbar.kMiddleSpacing,
    );
  }
}
