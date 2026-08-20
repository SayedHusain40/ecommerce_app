import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @languageName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageName;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get showLess;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'SEE ALL'**
  String get seeAll;

  /// No description provided for @seeAllLabel.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAllLabel;

  /// No description provided for @andWord.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get andWord;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get viewCart;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buyNow;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is Required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Email is InValid'**
  String get emailInvalid;

  /// No description provided for @emailRequiredLower.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequiredLower;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterValidEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is Required'**
  String get passwordRequired;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @newPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password and remember it.'**
  String get newPasswordSubtitle;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// No description provided for @oldPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter old password to change the password.'**
  String get oldPasswordSubtitle;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password is Required'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords not Match'**
  String get passwordsNotMatch;

  /// No description provided for @passwordChangedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your Password Changed Successfully'**
  String get passwordChangedSuccess;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'- Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordUppercase.
  ///
  /// In en, this message translates to:
  /// **'- Must contain an uppercase letter'**
  String get passwordUppercase;

  /// No description provided for @passwordLowercase.
  ///
  /// In en, this message translates to:
  /// **'- Must contain a lowercase letter'**
  String get passwordLowercase;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'- Must contain a number'**
  String get passwordNumber;

  /// No description provided for @passwordSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'- Must contain a special character'**
  String get passwordSpecialChar;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// No description provided for @signupWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Signup with Google'**
  String get signupWithGoogle;

  /// No description provided for @byLoginAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'By logging in, you agree to our'**
  String get byLoginAgreeTo;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is Required'**
  String get nameRequired;

  /// No description provided for @nameAlphaOnly.
  ///
  /// In en, this message translates to:
  /// **'Name must contain letters only'**
  String get nameAlphaOnly;

  /// No description provided for @nameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get nameMinLength;

  /// No description provided for @nameMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at most 50 characters'**
  String get nameMaxLength;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @confirmationEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Email'**
  String get confirmationEmailTitle;

  /// No description provided for @confirmationEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address for verification.'**
  String get confirmationEmailSubtitle;

  /// No description provided for @resendEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend Email'**
  String get resendEmail;

  /// No description provided for @resendInSeconds.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String resendInSeconds(int seconds);

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Explore a wide range of products'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Description.
  ///
  /// In en, this message translates to:
  /// **'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.'**
  String get onboarding1Description;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Unlock exclusive offers and discounts'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Description.
  ///
  /// In en, this message translates to:
  /// **'Get access to limited-time deals and special promotions available only to our valued customers.'**
  String get onboarding2Description;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Safe and secure payments'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Description.
  ///
  /// In en, this message translates to:
  /// **'QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.'**
  String get onboarding3Description;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @browseCategories.
  ///
  /// In en, this message translates to:
  /// **'Browse Categories'**
  String get browseCategories;

  /// No description provided for @latestProducts.
  ///
  /// In en, this message translates to:
  /// **'Latest Products'**
  String get latestProducts;

  /// No description provided for @bannerDiscount.
  ///
  /// In en, this message translates to:
  /// **'30% OFF'**
  String get bannerDiscount;

  /// No description provided for @bannerOnHeadphones.
  ///
  /// In en, this message translates to:
  /// **'On Headphones'**
  String get bannerOnHeadphones;

  /// No description provided for @bannerExclusiveSales.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Sales'**
  String get bannerExclusiveSales;

  /// No description provided for @searchForProducts.
  ///
  /// In en, this message translates to:
  /// **'Search for products...'**
  String get searchForProducts;

  /// No description provided for @searchResult.
  ///
  /// In en, this message translates to:
  /// **'Search Result:'**
  String get searchResult;

  /// No description provided for @typeToSearchProducts.
  ///
  /// In en, this message translates to:
  /// **'Type to search for products...'**
  String get typeToSearchProducts;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No Products Found'**
  String get noProductsFound;

  /// No description provided for @failedToGetProducts.
  ///
  /// In en, this message translates to:
  /// **'Failed to get Products'**
  String get failedToGetProducts;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong!'**
  String get somethingWentWrong;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @sortAlphabeticalAZ.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical (A-Z)'**
  String get sortAlphabeticalAZ;

  /// No description provided for @sortAlphabeticalZA.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical (Z-A)'**
  String get sortAlphabeticalZA;

  /// No description provided for @sortPriceHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Price (High to Low)'**
  String get sortPriceHighToLow;

  /// No description provided for @sortPriceLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Price (Low to High)'**
  String get sortPriceLowToHigh;

  /// No description provided for @sortRatingHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Rating (High to Low)'**
  String get sortRatingHighToLow;

  /// No description provided for @sortRatingLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Rating (Low to High)'**
  String get sortRatingLowToHigh;

  /// No description provided for @sortDiscountHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Discount (High to Low)'**
  String get sortDiscountHighToLow;

  /// No description provided for @sortDiscountLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Discount (Low to High)'**
  String get sortDiscountLowToHigh;

  /// No description provided for @sortStockHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Stock (High to Low)'**
  String get sortStockHighToLow;

  /// No description provided for @wishlistEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty'**
  String get wishlistEmptyTitle;

  /// No description provided for @wishlistEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap heart button to start saving your favorite items.'**
  String get wishlistEmptySubtitle;

  /// No description provided for @cartEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Looks like you have not added anything in your cart. Go ahead and explore top categories.'**
  String get cartEmptySubtitle;

  /// No description provided for @productAddedToWishlist.
  ///
  /// In en, this message translates to:
  /// **'The product has been added to your wishlist'**
  String get productAddedToWishlist;

  /// No description provided for @productAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'The product has been added to your cart'**
  String get productAddedToCart;

  /// No description provided for @exploreCategories.
  ///
  /// In en, this message translates to:
  /// **'Explore Categories'**
  String get exploreCategories;

  /// No description provided for @deleteProductFromWishlistConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete product from wishlist'**
  String get deleteProductFromWishlistConfirm;

  /// No description provided for @deleteProductFromCartConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete product from cart'**
  String get deleteProductFromCartConfirm;

  /// No description provided for @deleteAProduct.
  ///
  /// In en, this message translates to:
  /// **'Delete a product'**
  String get deleteAProduct;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @supportAndInformation.
  ///
  /// In en, this message translates to:
  /// **'Support & Information'**
  String get supportAndInformation;

  /// No description provided for @accountManagement.
  ///
  /// In en, this message translates to:
  /// **'Account Management'**
  String get accountManagement;

  /// No description provided for @shippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shippingAddress;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @faqCancelOrderQuestion.
  ///
  /// In en, this message translates to:
  /// **'Can I cancel my order?'**
  String get faqCancelOrderQuestion;

  /// No description provided for @faqCancelOrderAnswer.
  ///
  /// In en, this message translates to:
  /// **'Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.'**
  String get faqCancelOrderAnswer;

  /// No description provided for @faqSameProductQuestion.
  ///
  /// In en, this message translates to:
  /// **'Will I receive the same product I see in the photo?'**
  String get faqSameProductQuestion;

  /// No description provided for @faqSameProductAnswer.
  ///
  /// In en, this message translates to:
  /// **'Actual product color may vary from the images shown. Every monitor or mobile display has a different capability to display colors, and every individual may see these colors differently. In addition, lighting conditions at the time the photo was taken can also affect an image\'s color.'**
  String get faqSameProductAnswer;

  /// No description provided for @faqForgotPasswordQuestion.
  ///
  /// In en, this message translates to:
  /// **'How can I recover the forgotten password?'**
  String get faqForgotPasswordQuestion;

  /// No description provided for @faqForgotPasswordAnswer.
  ///
  /// In en, this message translates to:
  /// **'If you have forgotten your password, you can recover it from \"Login - Forgotten your password?\" section. You will receive an e-mail with a link to enter and confirm your new password.'**
  String get faqForgotPasswordAnswer;

  /// No description provided for @faqPersonalInfoQuestion.
  ///
  /// In en, this message translates to:
  /// **'Is my personal information confidential?'**
  String get faqPersonalInfoQuestion;

  /// No description provided for @faqPersonalInfoAnswer.
  ///
  /// In en, this message translates to:
  /// **'Your personal information is confidential. We do not rent, sell, barter or trade email addresses. When you place an order with us, we collect your name, address, telephone number, credit card information and your email address. We use this information to fulfill your order and to communicate with you about your order. All your information is kept confidential and will not be disclosed to anybody unless ordered by government authorities.'**
  String get faqPersonalInfoAnswer;

  /// No description provided for @faqPaymentMethodsQuestion.
  ///
  /// In en, this message translates to:
  /// **'What payment methods can I use to make purchases?'**
  String get faqPaymentMethodsQuestion;

  /// No description provided for @faqPaymentMethodsAnswer.
  ///
  /// In en, this message translates to:
  /// **'We offer the following payment methods: PayPal, VISA, MasterCard and Voucher code, if applicable.'**
  String get faqPaymentMethodsAnswer;

  /// No description provided for @helpCenterPrefix.
  ///
  /// In en, this message translates to:
  /// **'For any query, you can visit our website for '**
  String get helpCenterPrefix;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @helpCenterSuffix.
  ///
  /// In en, this message translates to:
  /// **' at Quickmart.com'**
  String get helpCenterSuffix;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyOurPolicy.
  ///
  /// In en, this message translates to:
  /// **'Our Policy'**
  String get privacyOurPolicy;

  /// No description provided for @privacyIntro.
  ///
  /// In en, this message translates to:
  /// **'At QuickMart, we are committed to protecting the privacy and security of our users\' personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard the information obtained through our e-commerce app. By using QuickMart, you consent to the practices described in this policy.'**
  String get privacyIntro;

  /// No description provided for @privacySection1Title.
  ///
  /// In en, this message translates to:
  /// **'Information Collection'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Point1.
  ///
  /// In en, this message translates to:
  /// **'We may collect personal information such as name, address, email, and phone number when you create an account, make a purchase, or interact with our services.'**
  String get privacySection1Point1;

  /// No description provided for @privacySection1Point2.
  ///
  /// In en, this message translates to:
  /// **'We collect information related to your purchases, including order history, payment method, and shipping details.'**
  String get privacySection1Point2;

  /// No description provided for @privacySection1Point3.
  ///
  /// In en, this message translates to:
  /// **'We may collect data on how you interact with our app, such as browsing activity, search queries, and preferences.'**
  String get privacySection1Point3;

  /// No description provided for @privacySection2Title.
  ///
  /// In en, this message translates to:
  /// **'Information Use'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Point1.
  ///
  /// In en, this message translates to:
  /// **'We use the collected information to process orders, deliver products, and provide customer support.'**
  String get privacySection2Point1;

  /// No description provided for @privacySection2Point2.
  ///
  /// In en, this message translates to:
  /// **'We may use your information to personalize your shopping experience, recommend products, and display targeted advertisements.'**
  String get privacySection2Point2;

  /// No description provided for @privacySection2Point3.
  ///
  /// In en, this message translates to:
  /// **'We may use your contact information to send important updates, promotional offers, and newsletters. You can opt-out of these communications at any time.'**
  String get privacySection2Point3;

  /// No description provided for @privacySection3Title.
  ///
  /// In en, this message translates to:
  /// **'Information Sharing'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Point1.
  ///
  /// In en, this message translates to:
  /// **'We may share your information with trusted third-party service providers who assist us in operating our app, fulfilling orders, and improving our services.'**
  String get privacySection3Point1;

  /// No description provided for @privacySection3Point2.
  ///
  /// In en, this message translates to:
  /// **'We may disclose personal information if required by law or in response to a valid legal request from authorities.'**
  String get privacySection3Point2;

  /// No description provided for @privacySection4Title.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Point1.
  ///
  /// In en, this message translates to:
  /// **'We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction.'**
  String get privacySection4Point1;

  /// No description provided for @privacySection4Point2.
  ///
  /// In en, this message translates to:
  /// **'However, please note that no data transmission over the internet or electronic storage is 100% secure. We cannot guarantee absolute security of your information.'**
  String get privacySection4Point2;

  /// No description provided for @privacySection5Title.
  ///
  /// In en, this message translates to:
  /// **'User Rights'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Point1.
  ///
  /// In en, this message translates to:
  /// **'You have the right to access, correct, or update your personal information stored in our app.'**
  String get privacySection5Point1;

  /// No description provided for @privacySection5Point2.
  ///
  /// In en, this message translates to:
  /// **'We retain your personal information as long as necessary to provide our services and comply with legal obligations.'**
  String get privacySection5Point2;

  /// No description provided for @privacySection6Title.
  ///
  /// In en, this message translates to:
  /// **'Children\'s Privacy'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Point1.
  ///
  /// In en, this message translates to:
  /// **'QuickMart is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from children.'**
  String get privacySection6Point1;

  /// No description provided for @privacySection7Title.
  ///
  /// In en, this message translates to:
  /// **'Updates to the Privacy Policy'**
  String get privacySection7Title;

  /// No description provided for @privacySection7Point1.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to update this Privacy Policy from time to time. Any changes will be posted on our app, and the revised policy will be effective upon posting.'**
  String get privacySection7Point1;

  /// No description provided for @privacyOutro.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions or concerns about our Privacy Policy, please contact our customer support. By using QuickMart, you acknowledge that you have read and understood this Privacy Policy and agree to its terms and conditions.'**
  String get privacyOutro;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @termsAndConditionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditionsTitle;

  /// No description provided for @termsOurTerms.
  ///
  /// In en, this message translates to:
  /// **'Our Terms'**
  String get termsOurTerms;

  /// No description provided for @termsIntro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to QuickMart! These Terms and Conditions (\"Terms\") govern your use of our e-commerce app. By accessing or using QuickMart, you agree to be bound by these Terms. Please read them carefully before proceeding.'**
  String get termsIntro;

  /// No description provided for @termsSection1Title.
  ///
  /// In en, this message translates to:
  /// **'Account Registration'**
  String get termsSection1Title;

  /// No description provided for @termsSection1Point1.
  ///
  /// In en, this message translates to:
  /// **'You must create an account to use certain features of QuickMart.'**
  String get termsSection1Point1;

  /// No description provided for @termsSection1Point2.
  ///
  /// In en, this message translates to:
  /// **'You are responsible for providing accurate and up-to-date information during the registration process.'**
  String get termsSection1Point2;

  /// No description provided for @termsSection1Point3.
  ///
  /// In en, this message translates to:
  /// **'You must safeguard your account credentials and notify us immediately of any unauthorized access or use of your account.'**
  String get termsSection1Point3;

  /// No description provided for @termsSection2Title.
  ///
  /// In en, this message translates to:
  /// **'Product Information and Pricing'**
  String get termsSection2Title;

  /// No description provided for @termsSection2Point1.
  ///
  /// In en, this message translates to:
  /// **'QuickMart strives to provide accurate product descriptions, images, and pricing information.'**
  String get termsSection2Point1;

  /// No description provided for @termsSection2Point2.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to modify product details and prices without prior notice.'**
  String get termsSection2Point2;

  /// No description provided for @termsSection2Point3.
  ///
  /// In en, this message translates to:
  /// **'In the event of an error, we may cancel or refuse orders placed for incorrectly priced products.'**
  String get termsSection2Point3;

  /// No description provided for @termsSection3Title.
  ///
  /// In en, this message translates to:
  /// **'Order Placement and Fulfillment'**
  String get termsSection3Title;

  /// No description provided for @termsSection3Point1.
  ///
  /// In en, this message translates to:
  /// **'By placing an order on QuickMart, you agree to purchase the selected products at the stated price.'**
  String get termsSection3Point1;

  /// No description provided for @termsSection3Point2.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to accept or reject any order, and we may cancel orders due to product unavailability, pricing errors, or suspected fraudulent activity.'**
  String get termsSection3Point2;

  /// No description provided for @termsSection3Point3.
  ///
  /// In en, this message translates to:
  /// **'Once an order is confirmed, we will make reasonable efforts to fulfill and deliver it in a timely manner.'**
  String get termsSection3Point3;

  /// No description provided for @termsSection4Title.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get termsSection4Title;

  /// No description provided for @termsSection4Point1.
  ///
  /// In en, this message translates to:
  /// **'QuickMart supports various payment methods, including credit/debit cards and online payment platforms.'**
  String get termsSection4Point1;

  /// No description provided for @termsSection4Point2.
  ///
  /// In en, this message translates to:
  /// **'By providing payment information, you represent and warrant that you are authorized to use the chosen payment method.'**
  String get termsSection4Point2;

  /// No description provided for @termsSection4Point3.
  ///
  /// In en, this message translates to:
  /// **'All payments are subject to verification and approval by relevant financial institutions.'**
  String get termsSection4Point3;

  /// No description provided for @termsSection5Title.
  ///
  /// In en, this message translates to:
  /// **'Shipping and Delivery'**
  String get termsSection5Title;

  /// No description provided for @termsSection5Point1.
  ///
  /// In en, this message translates to:
  /// **'QuickMart will make reasonable efforts to ensure timely delivery of products.'**
  String get termsSection5Point1;

  /// No description provided for @termsSection5Point2.
  ///
  /// In en, this message translates to:
  /// **'Shipping times may vary based on factors beyond our control, such as location, weather conditions, or carrier delays.'**
  String get termsSection5Point2;

  /// No description provided for @termsSection5Point3.
  ///
  /// In en, this message translates to:
  /// **'Risk of loss or damage to products passes to you upon delivery.'**
  String get termsSection5Point3;

  /// No description provided for @termsSection6Title.
  ///
  /// In en, this message translates to:
  /// **'Returns and Refunds'**
  String get termsSection6Title;

  /// No description provided for @termsSection6Point1.
  ///
  /// In en, this message translates to:
  /// **'QuickMart\'s return and refund policies are outlined separately and govern the process for returning products and seeking refunds.'**
  String get termsSection6Point1;

  /// No description provided for @termsSection6Point2.
  ///
  /// In en, this message translates to:
  /// **'Certain products may be non-returnable or subject to specific conditions.'**
  String get termsSection6Point2;

  /// No description provided for @termsSection7Title.
  ///
  /// In en, this message translates to:
  /// **'Intellectual Property'**
  String get termsSection7Title;

  /// No description provided for @termsSection7Point1.
  ///
  /// In en, this message translates to:
  /// **'QuickMart and its content, including logos, trademarks, text, images, and software, are protected by intellectual property rights.'**
  String get termsSection7Point1;

  /// No description provided for @termsSection7Point2.
  ///
  /// In en, this message translates to:
  /// **'You may not use, reproduce, modify, distribute, or display any part of QuickMart without our prior written consent.'**
  String get termsSection7Point2;

  /// No description provided for @termsSection8Title.
  ///
  /// In en, this message translates to:
  /// **'User Conduct'**
  String get termsSection8Title;

  /// No description provided for @termsSection8Point1.
  ///
  /// In en, this message translates to:
  /// **'You agree to use QuickMart in compliance with applicable laws and regulations.'**
  String get termsSection8Point1;

  /// No description provided for @termsSection8Point2.
  ///
  /// In en, this message translates to:
  /// **'You will not engage in any activity that disrupts or interferes with the functioning of QuickMart or infringes upon the rights of others.'**
  String get termsSection8Point2;

  /// No description provided for @termsSection8Point3.
  ///
  /// In en, this message translates to:
  /// **'Any unauthorized use or attempt to access restricted areas or user accounts is strictly prohibited.'**
  String get termsSection8Point3;

  /// No description provided for @termsSection9Title.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get termsSection9Title;

  /// No description provided for @termsSection9Point1.
  ///
  /// In en, this message translates to:
  /// **'QuickMart and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use or inability to use our app or any products purchased through it.'**
  String get termsSection9Point1;

  /// No description provided for @termsSection9Point2.
  ///
  /// In en, this message translates to:
  /// **'We do not guarantee the accuracy, completeness, or reliability of information provided on QuickMart.'**
  String get termsSection9Point2;

  /// No description provided for @termsSection10Title.
  ///
  /// In en, this message translates to:
  /// **'Governing Law'**
  String get termsSection10Title;

  /// No description provided for @termsSection10Point1.
  ///
  /// In en, this message translates to:
  /// **'These Terms shall be governed by and construed in accordance with the laws of [Jurisdiction].'**
  String get termsSection10Point1;

  /// No description provided for @termsSection10Point2.
  ///
  /// In en, this message translates to:
  /// **'Any disputes arising out of or relating to these Terms shall be resolved in the courts of [Jurisdiction].'**
  String get termsSection10Point2;

  /// No description provided for @termsOutro.
  ///
  /// In en, this message translates to:
  /// **'...'**
  String get termsOutro;

  /// No description provided for @emailVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get emailVerificationTitle;

  /// No description provided for @verifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Email'**
  String get verifyYourEmail;

  /// No description provided for @verifyEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification email to your email address.\nPlease check your inbox and verify your account.'**
  String get verifyEmailSubtitle;

  /// No description provided for @verificationEmailSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Verification email sent successfully'**
  String get verificationEmailSentSuccess;

  /// No description provided for @incorrectPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password'**
  String get incorrectPassword;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @whatsappHelpMessage.
  ///
  /// In en, this message translates to:
  /// **'Hello, I need help...'**
  String get whatsappHelpMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
