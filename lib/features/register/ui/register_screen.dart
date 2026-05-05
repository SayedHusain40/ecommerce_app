import 'package:ecommerce_app/core/constants/app_images.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/register/ui/widgets/required_lable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SvgPicture.asset(AppImages.logo(brightness)),
                SizedBox(height: 24),
                Text('Signup', style: AppTextStyles.headingH2Bold),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: AppTextStyles.body2Regular.copyWith(
                          color: AppColors.grey150(brightness),
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: AppTextStyles.body2Medium.copyWith(
                          color: AppColors.cyan,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacementNamed(
                              RouteNames.loginScreen,
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Form(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        RequiredLabel('Full Name'),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your name',
                          ),
                        ),
                        SizedBox(height: 16),
                        RequiredLabel('Email'),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your email',
                          ),
                        ),
                        SizedBox(height: 16),
                        RequiredLabel('Password'),
                        SizedBox(height: 8),
                        ValueListenableBuilder(
                          valueListenable: _isPasswordVisible,
                          builder: (context, value, child) {
                            return TextFormField(
                              obscureText: !value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      _isPasswordVisible.value = !value,
                                  icon: SvgPicture.asset(
                                    value
                                        ? AppImages.eyeLight
                                        : AppImages.eyeOffLight,
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Create Account'),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 60,
                          alignment: .center,
                          padding: .symmetric(horizontal: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .center,
                              mainAxisSize: .min,
                              children: [
                                Text(
                                  'Signup with Google',
                                  style: AppTextStyles.button2.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset(AppImages.googleLight),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
