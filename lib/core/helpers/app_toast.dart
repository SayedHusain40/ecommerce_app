import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toastification/toastification.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';

class AppToast {
  const AppToast._();

  static const double _navBarHeight = 80;

  static void success(
    BuildContext context,
    String message, {
    Widget Function(VoidCallback close)? trailing,
    bool showCloseButton = false,
    bool showAtTop = true,
    double navBarHeight = _navBarHeight,
  }) {
    final b = context.brightness;
    _show(
      context,
      message: message,
      color: AppColors.cyan,
      iconAsset: AppIcons.toastSuccess(b),
      trailing: trailing,
      showCloseButton: showCloseButton,
      showAtTop: showAtTop,
      navBarHeight: navBarHeight,
    );
  }

  static void error(
    BuildContext context,
    String message, {
    Widget Function(VoidCallback close)? trailing,
    bool showCloseButton = false,
    bool showAtTop = true,
    double navBarHeight = _navBarHeight,
  }) {
    final b = context.brightness;
    _show(
      context,
      message: message,
      color: AppColors.red,
      iconAsset: AppIcons.toastError(b),
      trailing: trailing,
      showCloseButton: showCloseButton,
      showAtTop: showAtTop,
      navBarHeight: navBarHeight,
    );
  }

  static void warning(
    BuildContext context,
    String message, {
    Widget Function(VoidCallback close)? trailing,
    bool showCloseButton = false,
    bool showAtTop = true,
    double navBarHeight = _navBarHeight,
  }) {
    final b = context.brightness;
    _show(
      context,
      message: message,
      color: AppColors.yellow,
      iconAsset: AppIcons.toastWarning(b),
      trailing: trailing,
      showCloseButton: showCloseButton,
      showAtTop: showAtTop,
      navBarHeight: navBarHeight,
    );
  }

  static void info(
    BuildContext context,
    String message, {
    Widget Function(VoidCallback close)? trailing,
    bool showCloseButton = false,
    bool showAtTop = true,
    double navBarHeight = _navBarHeight,
  }) {
    final b = context.brightness;
    _show(
      context,
      message: message,
      color: AppColors.grey150Light,
      iconAsset: AppIcons.toastInfo(b),
      trailing: trailing,
      showCloseButton: showCloseButton,
      showAtTop: showAtTop,
      navBarHeight: navBarHeight,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required String iconAsset,
    required Color color,
    Widget Function(VoidCallback close)? trailing,
    bool showCloseButton = false,
    bool showAtTop = true,
    double navBarHeight = _navBarHeight,
  }) {
    final brightness = context.brightness;

    toastification.showCustom(
      context: context,
      alignment: showAtTop ? Alignment.topCenter : Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),

      builder: (context, holder) {
        return Container(
          constraints: const BoxConstraints(minHeight: 46),
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: showAtTop ? 0 : navBarHeight,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            color: AppColors.blackInDark(brightness),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: AppColors.grey50(brightness)),
          ),
          child: Row(
            crossAxisAlignment: .center,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SvgPicture.asset(iconAsset, width: 20, height: 20),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(message, style: AppTextStyles.body3SemiBold),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing(() => toastification.dismiss(holder)),
              ],
              if (showCloseButton) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => toastification.dismiss(holder),
                  child: Icon(
                    Icons.close_rounded,
                    size: 18,
                    color: AppColors.whiteInDark(brightness),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
