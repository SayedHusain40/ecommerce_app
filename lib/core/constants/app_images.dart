import 'dart:ui';

class AppImages {
  const AppImages._();

  // -------------------- LOGOS --------------------
  static const String logoLight = 'assets/svgs/logo_light.svg';
  static const String logoDark = 'assets/svgs/logo_dark.svg';

  // -------------------- ONBOARDINGS --------------------
  static const String onboarding1 = 'assets/images/onboardings/onboarding1.png';
  static const String onboarding2 = 'assets/images/onboardings/onboarding2.png';
  static const String onboarding3 = 'assets/images/onboardings/onboarding3.png';

  // -------------------- ICONS --------------------
  static const String arrowLeftLight = 'assets/svgs/arrow-left_light.svg';
  static const String arrowLeftDark = 'assets/svgs/arrow-left_dark.svg';

  static const String arrowRightLight = 'assets/svgs/arrow-right_light.svg';

  static const String eyeLight = 'assets/svgs/eye_light.svg';
  static const String eyeOffLight = 'assets/svgs/eye_off_light.svg';

  static const String googleLight = 'assets/svgs/google_light.svg';

  static String logo(Brightness b) =>
      b == Brightness.dark ? logoDark : logoLight;
  static String arrowLeft(Brightness b) =>
      b == Brightness.dark ? arrowLeftDark : arrowLeftLight;

}
