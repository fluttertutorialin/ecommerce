/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR APPLICATION GLOBAL DECLARATION
*/

import 'dart:io';
import 'package:device_info/device_info.dart';

class Global{
  static String? accessToken;

  static bool isIOS = Platform.isIOS;

  static late AndroidDeviceInfo androidDeviceInfo;

  static late IosDeviceInfo iosDeviceInfo;
}