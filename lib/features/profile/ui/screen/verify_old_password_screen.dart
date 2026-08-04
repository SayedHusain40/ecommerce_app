import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/required_lable.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/logic/profile_state.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class VerifyOldPasswordScreen extends StatefulWidget {
  const VerifyOldPasswordScreen({super.key});

  @override
  State<VerifyOldPasswordScreen> createState() =>
      _VerifyOldPasswordScreenState();
}

class _VerifyOldPasswordScreenState extends State<VerifyOldPasswordScreen> {
  final _isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final cubit = context.read<ProfileCubit>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppCustomAppBar(
        title: l10n.changePassword,
        actions: [
          Text('01/', style: AppTextStyles.body2Medium),
          Text(
            '02',
            style: AppTextStyles.body2Medium.copyWith(color: AppColors.grey100),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.oldPassword, style: AppTextStyles.headingH2Bold),
              const SizedBox(height: 8),
              Text(
                l10n.oldPasswordSubtitle,
                style: AppTextStyles.body2Regular.copyWith(
                  color: AppColors.grey150(brightness),
                ),
              ),
              const SizedBox(height: 16),
              BlocConsumer<ProfileCubit, ProfileState>(
                listenWhen: (previous, current) =>
                    current is CheckPasswordSuccess ||
                    current is CheckPasswordLoading ||
                    current is CheckPasswordFailure,
                listener: (context, state) {
                  state.whenOrNull(
                    checkPasswordSuccess: () {
                      context.pushNamed(RouteNames.changePasswordNewScreen);
                    },
                    checkPasswordFailure: (AppFailure appFailure) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text(appFailure.message)),
                      // );

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        cubit.formKey.currentState?.validate();
                      });
                    },
                  );
                },
                buildWhen: (previous, current) =>
                    current is CheckPasswordLoading ||
                    current is CheckPasswordSuccess ||
                    current is CheckPasswordFailure,
                builder: (context, state) {
                  final isLoading = state is CheckPasswordLoading;

                  return Form(
                    key: cubit.formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequiredLabel(l10n.password),
                        const SizedBox(height: 8),
                        ValueListenableBuilder(
                          valueListenable: _isPasswordVisible,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: cubit.currentPasswordController,
                              obscureText: !value,
                              decoration: InputDecoration(
                                hintText: l10n.enterYourPassword,
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      _isPasswordVisible.value = !value,
                                  icon: SvgPicture.asset(
                                    value
                                        ? AppIcons.eyeOpen(brightness)
                                        : AppIcons.eyeOff(brightness),
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              onChanged: (_) {
                                cubit.resetCheckPasswordState();
                              },
                              validator: (value) {
                                if (value.isNullOrEmpty()) {
                                  return l10n.passwordRequired;
                                }
                                if (state is CheckPasswordFailure) {
                                  return l10n.incorrectPassword;
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : cubit.checkCurrentPassword,
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : Text(l10n.continueButton),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
