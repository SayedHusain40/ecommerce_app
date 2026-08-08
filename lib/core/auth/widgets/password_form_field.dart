import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
    required this.isVisible,
    required this.hintText,
    this.validator, this.onChanged,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isVisible;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged; 

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;

    return ValueListenableBuilder<bool>(
      valueListenable: isVisible,
      builder: (context, value, child) {
        return TextFormField(
          controller: controller,
          obscureText: !value,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: () => isVisible.value = !value,
              icon: SvgPicture.asset(
                value ? AppIcons.eyeOpen(brightness) : AppIcons.eyeOff(brightness),
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
          ),
          onChanged: onChanged,
          validator: validator,
        );
      },
    );
  }
}