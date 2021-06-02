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
  static const String emailTextLabel = 'Email';
  static const String passwordLabel = 'Passowrd';

  // LABEL
  static const String doNotHaveAccount = 'Don\'t have account?';
  
  // VALIDATION
  static const String cantBeEmpty = "can't be empty";

  static const String fieldCantBeEmpty = 'Field $cantBeEmpty';
  static const String emailCantBeEmpty = 'email $cantBeEmpty';
  static const String passwordCantBeEmpty = 'email $cantBeEmpty';
  static const String fieldOnlyLetterAndNumberAllowed = 'Only letters and numbers allowed';
  static const String enterValidEmail = 'Enter the valid email';
  static const String enterValidPassword = 'Enter the password minimum 8 characters.';

  // BUTTON
  static const String loginButton = 'Login';

  // VALIDATION LENGTH (MOBILE NO, EMAIL LENGTH ETC.)
  static const int splashScreenWait = 3;
  static const int mobileLength = 10;
  static const int emailLength = 50;
  static const int userNameLength = 10;
  static const int passwordLength = 10;
}
