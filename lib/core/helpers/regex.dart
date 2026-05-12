class Regex {
  const Regex._();

  // Email validation
  static bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]+$').hasMatch(email.trim());
  }

  // Strong password validation (8+ chars, uppercase, lowercase, number, special char)
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#?!@$%^&*-]).{8,}$',
    ).hasMatch(password);
  }

  static bool isBahrainPhoneValid(String phone) {
    return RegExp(r'^(?:\+973|973)?3\d{7}$').hasMatch(phone.trim());
  }

  static bool isAlphaOnly(String value) {
    return RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim());
  }

  static bool hasLowerCase(String password) =>
      RegExp(r'(?=.*[a-z])').hasMatch(password);

  static bool hasUpperCase(String password) =>
      RegExp(r'(?=.*[A-Z])').hasMatch(password);

  static bool hasNumber(String password) =>
      RegExp(r'(?=.*\d)').hasMatch(password);

  static bool hasSpecialCharacter(String password) =>
      RegExp(r'(?=.*[#?!@$%^&*-])').hasMatch(password);

  static bool hasMinLength(String password) => password.length >= 6;
}
