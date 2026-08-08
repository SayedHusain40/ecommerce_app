import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsArrowIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const SettingsArrowIcon({
    super.key,
    this.width = 15,
    this.height = 15,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = context.isRtl;

    return Transform.flip(
      flipX: isRtl,
      child: SvgPicture.asset(
        AppIcons.arrowRightSmall,
        width: width,
        height: height,
        fit: BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
