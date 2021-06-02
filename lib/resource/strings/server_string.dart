/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR API URL AND STATUS
*/

import 'package:flutter_config/flutter_config.dart';

class ServerString {
  const ServerString._();

  // API
  static String baseURL = FlutterConfig.get('BASE_URL');
  static String postUrl = '${baseURL}posts';

  // PARAMETER

  // DIO API RESPONSE STATUS
}
