/*
   DEVELOPED BY: KAMLESH LAKHANI
   STRING AND INT VALUE (APPLICATION NAME, DIO API RESPONSE STATUS, DIO ERROR, LABEL, VALIDATION, VALIDATION LENGTH)
*/

class ValueString {
  const ValueString._();

  // APPLICATION NAME
  static const String appName = 'Ecommerce';

  // TOAST MESSAGE
  static const String loginCancelToast = 'The login is cancel';
  static const String savedSuccessfullyToast = 'Saved successfully!';
  static const String savedFailToast = 'Saving failed, please try again!';
  static const String eventAlreadyFavouriteToast = 'This event is already in your favorite!';

  // DIO ERROR

  // TEXT-FIELD LABEL
  static const String userNameFormLabel = 'Username';
  static const String emailFormLabel = 'Email';
  static const String passwordFormLabel = 'Password';
  static const String mobileFormLabel = 'Mobile';

  // LABEL
  static const String doNotHaveAccount = 'Don\'t have account?';
  static const String signUp = 'Sign Up';

  // VALIDATION
  static const String cantBeEmpty = "can't be empty";

  static const String fieldCantBeEmpty = 'Field $cantBeEmpty';
  static const String emailCantBeEmpty = 'Email $cantBeEmpty';
  static const String passwordCantBeEmpty = 'Password $cantBeEmpty';
  static const String mobileCantBeEmpty = 'Mobile $cantBeEmpty';
  static const String userNameCantBeEmpty = 'Username $cantBeEmpty';
  static const String fieldOnlyLetterAndNumberAllowed = 'Only letters and numbers allowed';
  static const String enterValidEmail = 'Enter the valid email';
  static const String enterValidPassword = 'Enter the password minimum 8 characters';
  static const String enterValidMobile = 'Enter the mobile number must be 10 digit';
  static const String enterValidUserName = 'Enter the username must be 3 digit';

  // BUTTON
  static const String loginButton = 'Login';
  static const String signUpButton = 'Sign Up';

  // VALIDATION LENGTH (MOBILE NO, EMAIL LENGTH ETC.)
  static const int splashScreenWait = 3;
  static const int mobileLength = 10;
  static const int emailLength = 50;
  static const int userNameLength = 10;
  static const int passwordLength = 10;
}
