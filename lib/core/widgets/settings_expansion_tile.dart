import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/settings_arrow_icon.dart';

class SettingsExpansionTile extends StatefulWidget {
  const SettingsExpansionTile({
    super.key,
    required this.title,
    required this.leading,
    this.trailingText,
    required this.children,
    this.tilePadding = 16,
    this.childrenPaddingHorizontal = 16,
    this.childrenPaddingVertical = 16,
    this.minTileHeight = 48,
    this.leadingColor,
    this.titleStyle,
  });

  final String title;
  final Widget leading;
  final String? trailingText;
  final List<Widget> children;

  final double tilePadding;
  final double childrenPaddingHorizontal;
  final double childrenPaddingVertical;
  final double minTileHeight;
  final Color? leadingColor;
  final TextStyle? titleStyle;

  @override
  State<SettingsExpansionTile> createState() => _SettingsExpansionTileState();
}

class _SettingsExpansionTileState extends State<SettingsExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isRtl = context.isRtl;

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: ExpansionTile(
          minTileHeight: widget.minTileHeight,
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,

          collapsedIconColor: widget.leadingColor,
          iconColor: widget.leadingColor,

          shape: const Border(),
          collapsedShape: const Border(),

          leading: widget.leading,

          title: Text(
            widget.title,
            style: widget.titleStyle ?? AppTextStyles.body2Medium,
          ),

          tilePadding: EdgeInsets.symmetric(horizontal: widget.tilePadding),

          childrenPadding: EdgeInsets.symmetric(
            horizontal: widget.childrenPaddingHorizontal,
            vertical: widget.childrenPaddingVertical,
          ),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.trailingText != null) ...[
                Text(widget.trailingText!, style: AppTextStyles.body2Regular),
                const SizedBox(width: 10),
              ],

              AnimatedRotation(
                turns: isExpanded ? (isRtl ? -0.25 : 0.25) : 0,
                duration: const Duration(milliseconds: 200),
                child: const SettingsArrowIcon(),
              ),
            ],
          ),

          onExpansionChanged: (value) {
            setState(() => isExpanded = value);
          },

          children: widget.children,
        ),
      ),
    );
  }
}
