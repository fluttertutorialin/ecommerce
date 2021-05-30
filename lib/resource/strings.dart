/*
   DEVELOPED BY: KAMLESH LAKHANI
   STRING AND INT VALUE (APPLICATION NAME, DIO API RESPONSE STATUS, DIO ERROR, LABEL, VALIDATION, VALIDATION LENGTH)
*/

class Strings {
  const Strings._();

  //APPLICATION NAME
  static const String appName = 'Ecommerce';

  //API
  static const String baseURL = 'https://jsonplaceholder.typicode.com/';
  static const String postUrl = '${baseURL}posts';


  //DIO API RESPONSE STATUS

  //DIO ERROR

  //LABEL
  static const String doNotHaveAccount = 'Don\'t have account?';
  
  //VALIDATION
  static const String cantBeEmpty = "can't be empty.";

  static const String fieldCantBeEmpty = 'Field $cantBeEmpty';

  //VALIDATION LENGTH (MOBILE NO, EMAIL LENGTH ETC.)
  static int mobileLength = 10;
  static int emailLength = 50;
  static int userNameLength = 10;
  static int passwordLength = 10;
}
