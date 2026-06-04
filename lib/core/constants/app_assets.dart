import 'dart:ui';

// -------------------- IMAGES --------------------
class AppImages {
  const AppImages._();

  // LOGOS
  static const String logoLight = 'assets/svgs/logo_light.svg';
  static const String logoDark = 'assets/svgs/logo_dark.svg';

  // ONBOARDINGS
  static const String onboarding1 = 'assets/images/onboardings/onboarding1.png';
  static const String onboarding2 = 'assets/images/onboardings/onboarding2.png';
  static const String onboarding3 = 'assets/images/onboardings/onboarding3.png';

  // Banners
  static const String banner1 = 'assets/images/banners/banner1.png';

  // Helpers 
  static String logo(Brightness b) =>
      b == Brightness.dark ? logoDark : logoLight;
}

// -------------------- ICONS --------------------
class AppIcons {
  const AppIcons._();

  // ARROW LEFT
  static const String arrowLeftLight = 'assets/svgs/arrow-left_light.svg';
  static const String arrowLeftDark = 'assets/svgs/arrow-left_dark.svg';

  // ARROW RIGHT
  static const String arrowRightLight = 'assets/svgs/arrow-right_light.svg';

  // EYE
  static const String eyeLight = 'assets/svgs/eye_light.svg';
  static const String eyeDark = 'assets/svgs/eye_dark.svg';

  // EYE OFF
  static const String eyeOffLight = 'assets/svgs/eye_off_light.svg';
  static const String eyeOffDark = 'assets/svgs/eye_off_dark.svg';

  // GOOGLE
  static const String googleLight = 'assets/svgs/google_light.svg';

  // TICK CIRCLE
  static const String tickCircleLight = 'assets/svgs/tick-circle_light.svg';
  static const String tickCircleDark = 'assets/svgs/tick-circle_dark.svg';

  static const String minusLight = 'assets/svgs/minus_light.svg';
  static const String minusDark = 'assets/svgs/minus_dark.svg';
  static const String minusDisabled = 'assets/svgs/minus_disabled.svg';

  static const String addLight = 'assets/svgs/add_light.svg';
  static const String addDark = 'assets/svgs/add_dark.svg';

  static const String shoppingCart = 'assets/svgs/shopping-cart.svg';


  // Helpers
  static String arrowLeft(Brightness b) =>
      b == Brightness.dark ? arrowLeftDark : arrowLeftLight;

  static String eyeOpen(Brightness b) =>
      b == Brightness.dark ? eyeDark : eyeLight;

  static String eyeOff(Brightness b) =>
      b == Brightness.dark ? eyeOffDark : eyeOffLight;

  static String tickCircle(Brightness b) =>
      b == Brightness.dark ? tickCircleDark : tickCircleLight;

  static String add(Brightness b) => b == Brightness.dark ? addDark : addLight;

  static String minus(Brightness b) =>
      b == Brightness.dark ? minusDark : minusLight;
}
