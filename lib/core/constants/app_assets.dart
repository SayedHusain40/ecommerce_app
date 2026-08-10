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

  // empty
  static const String emptyWishlist = 'assets/images/empty/empty-wishlist.png';

  // flags
  static const String usFlag = 'assets/images/flags/us.png';
  static const String saFlag = 'assets/images/flags/sa.png';

  // success
  static const String newPasswordSetSuccessfully = 'assets/images/success/new_password_set _successfully.png';


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

  static const String searchLight = 'assets/svgs/search_light.svg';
  static const String searchDark = 'assets/svgs/search_dark.svg';
  static const String searchGray = 'assets/svgs/search_gray.svg';

  static const String settingLight = 'assets/svgs/setting_light.svg';
  static const String settingDark = 'assets/svgs/setting_dark.svg';

  static const String cancelLight = 'assets/svgs/cancel_light.svg';
  static const String cancelDark = 'assets/svgs/cancel_dark.svg';

  static const String trash = 'assets/svgs/trash.svg';

  static const String logout = 'assets/svgs/logout.svg';

  static const String arrowRightSmall = 'assets/svgs/arrow-right-small.svg';

  // NAVIGATION - ACTIVE (same icon for both themes)
  static const String activeHome = 'assets/svgs/nav/active-home.svg';
  static const String activeCategory = 'assets/svgs/nav/active-category.svg';
  static const String activeHeart = 'assets/svgs/nav/active-heart.svg';
  static const String activeShoppingCart =
      'assets/svgs/nav/active-shopping-cart.svg';
  static const String activeProfile = 'assets/svgs/nav/active-profile.svg';

  // NAVIGATION 
  static const String inactiveHomeWhite =
      'assets/svgs/nav/inactive-home-white.svg';
  static const String inactiveHomeDark =
      'assets/svgs/nav/inactive-home-dark.svg';

  static const String inactiveCategoryWhite =
      'assets/svgs/nav/inactive-category-white.svg';
  static const String inactiveCategoryDark =
      'assets/svgs/nav/inactive-category-dark.svg';

  static const String inactiveHeartWhite =
      'assets/svgs/nav/inactive-heart-white.svg';
  static const String inactiveHeartDark =
      'assets/svgs/nav/inactive-heart-dark.svg';

  static const String inactiveShoppingCartWhite =
      'assets/svgs/nav/inactive-shopping-cart-white.svg';
  static const String inactiveShoppingCartDark =
      'assets/svgs/nav/inactive-shopping-cart-dark.svg';

  static const String inactiveProfileWhite =
      'assets/svgs/nav/inactive-profile-white.svg';
  static const String inactiveProfileDark =
      'assets/svgs/nav/inactive-profile-dark.svg';

  
    // SETTINGS TILE ICONS
  static const String changePasswordDark = 'assets/svgs/settings/change-password-dark.svg';
  static const String changePasswordLight = 'assets/svgs/settings/change-password-light.svg'; // double dash in filename, fix if possible

  static const String faqDark = 'assets/svgs/settings/faq-dark.svg';
  static const String faqLight = 'assets/svgs/settings/faq-light.svg';

  static const String orderHistoryDark = 'assets/svgs/settings/order-history-dark.svg';
  static const String orderHistoryLight = 'assets/svgs/settings/order-history-light.svg';

  static const String paymentDark = 'assets/svgs/settings/payment-dark.svg'; 
  static const String paymentLight = 'assets/svgs/settings/payment-light.svg';

  static const String policyDark = 'assets/svgs/settings/policy-dark.svg';
  static const String policyLight = 'assets/svgs/settings/policy-light.svg';

  static const String shippingDark = 'assets/svgs/settings/shipping-dark.svg';
  static const String shippingLight = 'assets/svgs/settings/shipping-light.svg';

  static const String termDark = 'assets/svgs/settings/term-dark.svg';
  static const String termLight = 'assets/svgs/settings/term-light.svg';

  static const String themeDark = 'assets/svgs/settings/theme-dark.svg';
  static const String themeLight = 'assets/svgs/settings/theme-light.svg';

  static const String whatsApp = 'assets/svgs/settings/whats-app.svg';

    static String changePassword(Brightness b) =>
      b == Brightness.dark ? changePasswordDark : changePasswordLight;

  static String faq(Brightness b) =>
      b == Brightness.dark ? faqDark : faqLight;

  static String orderHistory(Brightness b) =>
      b == Brightness.dark ? orderHistoryDark : orderHistoryLight;

  static String policy(Brightness b) =>
      b == Brightness.dark ? policyDark : policyLight;

  static String shipping(Brightness b) =>
      b == Brightness.dark ? shippingDark : shippingLight;

  static String payment(Brightness b) =>
      b == Brightness.dark ? paymentDark : paymentLight;

  static String term(Brightness b) =>
      b == Brightness.dark ? termDark : termLight;

  static String theme(Brightness b) =>
      b == Brightness.dark ? themeDark : themeLight;

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

  static String search(Brightness b) =>
      b == Brightness.dark ? searchDark : searchLight;

  static String setting(Brightness b) =>
      b == Brightness.dark ? settingDark : settingLight;

  static String cancel(Brightness b) =>
      b == Brightness.dark ? cancelDark : cancelLight;

  static String inactiveHome(Brightness b) =>
      b == Brightness.dark ? inactiveHomeDark : inactiveHomeWhite;

  static String inactiveCategory(Brightness b) =>
      b == Brightness.dark ? inactiveCategoryDark : inactiveCategoryWhite;

  static String inactiveHeart(Brightness b) =>
      b == Brightness.dark ? inactiveHeartDark : inactiveHeartWhite;

  static String inactiveShoppingCart(Brightness b) => b == Brightness.dark
      ? inactiveShoppingCartDark
      : inactiveShoppingCartWhite;

  static String inactiveProfile(Brightness b) =>
      b == Brightness.dark ? inactiveProfileDark : inactiveProfileWhite;

    
    // TOAST
  static const String successDark = 'assets/svgs/toast/success-dark.svg';
  static const String successLight = 'assets/svgs/toast/success-light.svg';

  static const String errorDark = 'assets/svgs/toast/error-dark.svg';
  static const String errorLight = 'assets/svgs/toast/error-light.svg';

  static const String warningDark = 'assets/svgs/toast/warning-dark.svg';
  static const String warningLight = 'assets/svgs/toast/warning-light.svg';

  static const String infoDark = 'assets/svgs/toast/info-dark.svg';
  static const String infoLight = 'assets/svgs/toast/info-light.svg';

  // Helpers
  static String toastSuccess(Brightness b) =>
      b == Brightness.dark ? successDark : successLight;

  static String toastError(Brightness b) =>
      b == Brightness.dark ? errorDark : errorLight;

  static String toastWarning(Brightness b) =>
      b == Brightness.dark ? warningDark : warningLight;

  static String toastInfo(Brightness b) =>
      b == Brightness.dark ? infoDark : infoLight;
}
