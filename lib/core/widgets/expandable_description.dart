import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableDescription extends StatefulWidget {
  final String text;
  const ExpandableDescription({super.key, required this.text});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isExpanded = false;
  static const int _maxChars = 120;

  @override
  Widget build(BuildContext context) {
    final fullText = widget.text;

    // determine how much max chars
    final bool isLong = fullText.length > _maxChars;

    // if expanded → show full text
    // if not expanded and text is long → cut at _maxChars and add "..."
    // if not expanded and text is short → show full text as is
    final String displayText = _isExpanded || !isLong
        ? fullText
        : '${fullText.substring(0, _maxChars)}... ';

    return RichText(
      text: TextSpan(
        text: displayText,
        style: AppTextStyles.body2Regular.copyWith(
          color: AppColors.grey150Light,
        ),
        children: isLong
            ? [
                TextSpan(
                  text: _isExpanded ? ' Show Less' : 'Read More',
                  style: AppTextStyles.body2Regular.copyWith(
                    color: AppColors.cyan,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() => _isExpanded = !_isExpanded);
                    },
                ),
              ]
            : [],
      ),
    );
  }
}