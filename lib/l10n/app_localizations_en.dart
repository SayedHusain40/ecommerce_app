// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get languageName => 'English';

  @override
  String get language => 'Language';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get cart => 'Cart';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get products => 'Products';

  @override
  String get categories => 'Categories';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get showLess => 'Show less';

  @override
  String get showMore => 'Show More';

  @override
  String get next => 'Next';

  @override
  String get seeAll => 'SEE ALL';

  @override
  String get seeAllLabel => 'See All';

  @override
  String get andWord => 'and';

  @override
  String get email => 'Email';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get emailRequired => 'Email is Required';

  @override
  String get emailInvalid => 'Email is InValid';

  @override
  String get emailRequiredLower => 'Email is required';

  @override
  String get enterValidEmail => 'Enter a valid email';

  @override
  String get password => 'Password';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get passwordRequired => 'Password is Required';

  @override
  String get newPassword => 'New Password';

  @override
  String get newPasswordSubtitle => 'Enter your new password and remember it.';

  @override
  String get oldPassword => 'Old Password';

  @override
  String get oldPasswordSubtitle =>
      'Enter old password to change the password.';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordRequired => 'Confirm Password is Required';

  @override
  String get passwordsNotMatch => 'Passwords not Match';

  @override
  String get passwordChangedSuccess => 'Your Password Changed Successfully';

  @override
  String get passwordMinLength => '- Password must be at least 6 characters';

  @override
  String get passwordUppercase => '- Must contain an uppercase letter';

  @override
  String get passwordLowercase => '- Must contain a lowercase letter';

  @override
  String get passwordNumber => '- Must contain a number';

  @override
  String get passwordSpecialChar => '- Must contain a special character';

  @override
  String get continueButton => 'Continue';

  @override
  String get changePassword => 'Change Password';

  @override
  String get login => 'Login';

  @override
  String get signup => 'Signup';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get forgotPasswordTitle => 'Forgot Password';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get signupWithGoogle => 'Signup with Google';

  @override
  String get byLoginAgreeTo => 'By logging in, you agree to our';

  @override
  String get fullName => 'Full Name';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get nameRequired => 'Name is Required';

  @override
  String get nameAlphaOnly => 'Name must contain letters only';

  @override
  String get nameMinLength => 'Name must be at least 3 characters';

  @override
  String get nameMaxLength => 'Name must be at most 50 characters';

  @override
  String get createAccount => 'Create Account';

  @override
  String get confirmationEmailTitle => 'Confirmation Email';

  @override
  String get confirmationEmailSubtitle =>
      'Enter your email address for verification.';

  @override
  String get resendEmail => 'Resend Email';

  @override
  String resendInSeconds(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get onboarding1Title => 'Explore a wide range of products';

  @override
  String get onboarding1Description =>
      'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.';

  @override
  String get onboarding2Title => 'Unlock exclusive offers and discounts';

  @override
  String get onboarding2Description =>
      'Get access to limited-time deals and special promotions available only to our valued customers.';

  @override
  String get onboarding3Title => 'Safe and secure payments';

  @override
  String get onboarding3Description =>
      'QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get getStarted => 'Get Started';

  @override
  String get browseCategories => 'Browse Categories';

  @override
  String get latestProducts => 'Latest Products';

  @override
  String get bannerDiscount => '30% OFF';

  @override
  String get bannerOnHeadphones => 'On Headphones';

  @override
  String get bannerExclusiveSales => 'Exclusive Sales';

  @override
  String get searchForProducts => 'Search for products...';

  @override
  String get searchResult => 'Search Result:';

  @override
  String get typeToSearchProducts => 'Type to search for products...';

  @override
  String get noProductsFound => 'No Products Found';

  @override
  String get failedToGetProducts => 'Failed to get Products';

  @override
  String get somethingWentWrong => 'Something Went Wrong!';

  @override
  String get filter => 'Filter';

  @override
  String get sortBy => 'Sort By';

  @override
  String get apply => 'Apply';

  @override
  String get sortAlphabeticalAZ => 'Alphabetical (A-Z)';

  @override
  String get sortAlphabeticalZA => 'Alphabetical (Z-A)';

  @override
  String get sortPriceHighToLow => 'Price (High to Low)';

  @override
  String get sortPriceLowToHigh => 'Price (Low to High)';

  @override
  String get sortRatingHighToLow => 'Rating (High to Low)';

  @override
  String get sortRatingLowToHigh => 'Rating (Low to High)';

  @override
  String get sortDiscountHighToLow => 'Discount (High to Low)';

  @override
  String get sortDiscountLowToHigh => 'Discount (Low to High)';

  @override
  String get sortStockHighToLow => 'Stock (High to Low)';

  @override
  String get wishlistEmptyTitle => 'Your wishlist is empty';

  @override
  String get wishlistEmptySubtitle =>
      'Tap heart button to start saving your favorite items.';

  @override
  String get exploreCategories => 'Explore Categories';

  @override
  String get deleteProductFromWishlistConfirm => 'Delete product from wishlist';

  @override
  String get deleteAProduct => 'Delete a product';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get supportAndInformation => 'Support & Information';

  @override
  String get accountManagement => 'Account Management';

  @override
  String get shippingAddress => 'Shipping Address';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get orderHistory => 'Order History';

  @override
  String get faqs => 'FAQs';

  @override
  String get faqCancelOrderQuestion => 'Can I cancel my order?';

  @override
  String get faqCancelOrderAnswer =>
      'Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.';

  @override
  String get faqSameProductQuestion =>
      'Will I receive the same product I see in the photo?';

  @override
  String get faqSameProductAnswer =>
      'Actual product color may vary from the images shown. Every monitor or mobile display has a different capability to display colors, and every individual may see these colors differently. In addition, lighting conditions at the time the photo was taken can also affect an image\'s color.';

  @override
  String get faqForgotPasswordQuestion =>
      'How can I recover the forgotten password?';

  @override
  String get faqForgotPasswordAnswer =>
      'If you have forgotten your password, you can recover it from \"Login - Forgotten your password?\" section. You will receive an e-mail with a link to enter and confirm your new password.';

  @override
  String get faqPersonalInfoQuestion =>
      'Is my personal information confidential?';

  @override
  String get faqPersonalInfoAnswer =>
      'Your personal information is confidential. We do not rent, sell, barter or trade email addresses. When you place an order with us, we collect your name, address, telephone number, credit card information and your email address. We use this information to fulfill your order and to communicate with you about your order. All your information is kept confidential and will not be disclosed to anybody unless ordered by government authorities.';

  @override
  String get faqPaymentMethodsQuestion =>
      'What payment methods can I use to make purchases?';

  @override
  String get faqPaymentMethodsAnswer =>
      'We offer the following payment methods: PayPal, VISA, MasterCard and Voucher code, if applicable.';

  @override
  String get helpCenterPrefix =>
      'For any query, you can visit our website for ';

  @override
  String get helpCenter => 'Help Center';

  @override
  String get helpCenterSuffix => ' at Quickmart.com';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyOurPolicy => 'Our Policy';

  @override
  String get privacyIntro =>
      'At QuickMart, we are committed to protecting the privacy and security of our users\' personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard the information obtained through our e-commerce app. By using QuickMart, you consent to the practices described in this policy.';

  @override
  String get privacySection1Title => 'Information Collection';

  @override
  String get privacySection1Point1 =>
      'We may collect personal information such as name, address, email, and phone number when you create an account, make a purchase, or interact with our services.';

  @override
  String get privacySection1Point2 =>
      'We collect information related to your purchases, including order history, payment method, and shipping details.';

  @override
  String get privacySection1Point3 =>
      'We may collect data on how you interact with our app, such as browsing activity, search queries, and preferences.';

  @override
  String get privacySection2Title => 'Information Use';

  @override
  String get privacySection2Point1 =>
      'We use the collected information to process orders, deliver products, and provide customer support.';

  @override
  String get privacySection2Point2 =>
      'We may use your information to personalize your shopping experience, recommend products, and display targeted advertisements.';

  @override
  String get privacySection2Point3 =>
      'We may use your contact information to send important updates, promotional offers, and newsletters. You can opt-out of these communications at any time.';

  @override
  String get privacySection3Title => 'Information Sharing';

  @override
  String get privacySection3Point1 =>
      'We may share your information with trusted third-party service providers who assist us in operating our app, fulfilling orders, and improving our services.';

  @override
  String get privacySection3Point2 =>
      'We may disclose personal information if required by law or in response to a valid legal request from authorities.';

  @override
  String get privacySection4Title => 'Data Security';

  @override
  String get privacySection4Point1 =>
      'We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction.';

  @override
  String get privacySection4Point2 =>
      'However, please note that no data transmission over the internet or electronic storage is 100% secure. We cannot guarantee absolute security of your information.';

  @override
  String get privacySection5Title => 'User Rights';

  @override
  String get privacySection5Point1 =>
      'You have the right to access, correct, or update your personal information stored in our app.';

  @override
  String get privacySection5Point2 =>
      'We retain your personal information as long as necessary to provide our services and comply with legal obligations.';

  @override
  String get privacySection6Title => 'Children\'s Privacy';

  @override
  String get privacySection6Point1 =>
      'QuickMart is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from children.';

  @override
  String get privacySection7Title => 'Updates to the Privacy Policy';

  @override
  String get privacySection7Point1 =>
      'We reserve the right to update this Privacy Policy from time to time. Any changes will be posted on our app, and the revised policy will be effective upon posting.';

  @override
  String get privacyOutro =>
      'If you have any questions or concerns about our Privacy Policy, please contact our customer support. By using QuickMart, you acknowledge that you have read and understood this Privacy Policy and agree to its terms and conditions.';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get termsAndConditionsTitle => 'Terms & Conditions';

  @override
  String get termsOurTerms => 'Our Terms';

  @override
  String get termsIntro =>
      'Welcome to QuickMart! These Terms and Conditions (\"Terms\") govern your use of our e-commerce app. By accessing or using QuickMart, you agree to be bound by these Terms. Please read them carefully before proceeding.';

  @override
  String get termsSection1Title => 'Account Registration';

  @override
  String get termsSection1Point1 =>
      'You must create an account to use certain features of QuickMart.';

  @override
  String get termsSection1Point2 =>
      'You are responsible for providing accurate and up-to-date information during the registration process.';

  @override
  String get termsSection1Point3 =>
      'You must safeguard your account credentials and notify us immediately of any unauthorized access or use of your account.';

  @override
  String get termsSection2Title => 'Product Information and Pricing';

  @override
  String get termsSection2Point1 =>
      'QuickMart strives to provide accurate product descriptions, images, and pricing information.';

  @override
  String get termsSection2Point2 =>
      'We reserve the right to modify product details and prices without prior notice.';

  @override
  String get termsSection2Point3 =>
      'In the event of an error, we may cancel or refuse orders placed for incorrectly priced products.';

  @override
  String get termsSection3Title => 'Order Placement and Fulfillment';

  @override
  String get termsSection3Point1 =>
      'By placing an order on QuickMart, you agree to purchase the selected products at the stated price.';

  @override
  String get termsSection3Point2 =>
      'We reserve the right to accept or reject any order, and we may cancel orders due to product unavailability, pricing errors, or suspected fraudulent activity.';

  @override
  String get termsSection3Point3 =>
      'Once an order is confirmed, we will make reasonable efforts to fulfill and deliver it in a timely manner.';

  @override
  String get termsSection4Title => 'Payment';

  @override
  String get termsSection4Point1 =>
      'QuickMart supports various payment methods, including credit/debit cards and online payment platforms.';

  @override
  String get termsSection4Point2 =>
      'By providing payment information, you represent and warrant that you are authorized to use the chosen payment method.';

  @override
  String get termsSection4Point3 =>
      'All payments are subject to verification and approval by relevant financial institutions.';

  @override
  String get termsSection5Title => 'Shipping and Delivery';

  @override
  String get termsSection5Point1 =>
      'QuickMart will make reasonable efforts to ensure timely delivery of products.';

  @override
  String get termsSection5Point2 =>
      'Shipping times may vary based on factors beyond our control, such as location, weather conditions, or carrier delays.';

  @override
  String get termsSection5Point3 =>
      'Risk of loss or damage to products passes to you upon delivery.';

  @override
  String get termsSection6Title => 'Returns and Refunds';

  @override
  String get termsSection6Point1 =>
      'QuickMart\'s return and refund policies are outlined separately and govern the process for returning products and seeking refunds.';

  @override
  String get termsSection6Point2 =>
      'Certain products may be non-returnable or subject to specific conditions.';

  @override
  String get termsSection7Title => 'Intellectual Property';

  @override
  String get termsSection7Point1 =>
      'QuickMart and its content, including logos, trademarks, text, images, and software, are protected by intellectual property rights.';

  @override
  String get termsSection7Point2 =>
      'You may not use, reproduce, modify, distribute, or display any part of QuickMart without our prior written consent.';

  @override
  String get termsSection8Title => 'User Conduct';

  @override
  String get termsSection8Point1 =>
      'You agree to use QuickMart in compliance with applicable laws and regulations.';

  @override
  String get termsSection8Point2 =>
      'You will not engage in any activity that disrupts or interferes with the functioning of QuickMart or infringes upon the rights of others.';

  @override
  String get termsSection8Point3 =>
      'Any unauthorized use or attempt to access restricted areas or user accounts is strictly prohibited.';

  @override
  String get termsSection9Title => 'Limitation of Liability';

  @override
  String get termsSection9Point1 =>
      'QuickMart and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use or inability to use our app or any products purchased through it.';

  @override
  String get termsSection9Point2 =>
      'We do not guarantee the accuracy, completeness, or reliability of information provided on QuickMart.';

  @override
  String get termsSection10Title => 'Governing Law';

  @override
  String get termsSection10Point1 =>
      'These Terms shall be governed by and construed in accordance with the laws of [Jurisdiction].';

  @override
  String get termsSection10Point2 =>
      'Any disputes arising out of or relating to these Terms shall be resolved in the courts of [Jurisdiction].';

  @override
  String get termsOutro => '...';

  @override
  String get emailVerificationTitle => 'Email Verification';

  @override
  String get verifyYourEmail => 'Verify Your Email';

  @override
  String get verifyEmailSubtitle =>
      'We sent a verification email to your email address.\nPlease check your inbox and verify your account.';

  @override
  String get verificationEmailSentSuccess =>
      'Verification email sent successfully';

  @override
  String get incorrectPassword => 'Incorrect password';

  @override
  String get settings => 'Settings';

  @override
  String get orders => 'Orders';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get whatsappHelpMessage => 'Hello, I need help...';
}
