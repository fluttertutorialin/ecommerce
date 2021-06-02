/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR APPLICATION GLOBAL DECLARATION
*/

import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class Global{
  static String? accessToken;

  static bool isIOS = Platform.isIOS;

  static bool isAndroid = Platform.isAndroid;

  static late AndroidDeviceInfo androidDeviceInfo;

  static late IosDeviceInfo iosDeviceInfo;
}