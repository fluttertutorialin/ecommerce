/*
   DEVELOPED BY: KAMLESH LAKHANI
   runApp BEFORE THE INITIALIZATION
*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'import_package.dart';
import 'shared/common/dio_helper.dart';
import 'shared/common/get_storage.dart';
import 'shared/common/global.dart';
import 'shared/notification/firebase_notification.dart';
import 'shared/provider/firebase_provider.dart';
import 'shared/provider/network_provider.dart';
import 'shared/repository/network_repository.dart';

class Initializer {
  static final Initializer instance = Initializer._internal();
  factory Initializer() => instance;
  Initializer._internal();

  void init(VoidCallback runApp) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        printInfo(info: details.stack.toString());
      };

      //SET SYSTEM LIGHT MODE COLOR (FOR STATUS COLOR, NAVIGATION BAR COLOR ETC.)
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark));

      //ALL INIT ACCESS
      await _initServices();
      runApp();
    }, (error, stack) {
      printInfo(info: 'runZonedGuarded: ${stack.toString()}');
    });
  }

  //ALL INIT DEFINE
  Future<void> _initServices() async {
    try {
      await FlutterConfig.loadEnvVariables();

      _deviceInformation();

      _initGetStorage();
      _initScreenOrientations();
      _initFireBase();

      _initLazyPut();

      //NOTIFICATION
      _firebaseNotification();
      _oneSignalInit();
    } catch (err) {
      rethrow;
    }
  }

  //GET STORAGE INIT
  _initGetStorage() async {
    await GetStorage.init();

    /// OPTIONAL STORAGE (CONTAINER) NAME
  }

  _firebaseNotification() async {
    await FirebaseNotification.initializeFCM(
        onNotificationPressed: (Map<String, dynamic> data) {
          print(data);
        },
        onTokenChanged: (String? token) {
          print(token);
        },
        icon: 'icon');
  }

  //SCREEN ORIENTATIONS INIT
  void _initScreenOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initLazyPut() {
    //DIO HELPER
    GetInstanceAccess.lazyPut<DioHelper>(() => DioHelper(), fenix: false);

    //FIREBASE
    GetInstanceAccess.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance, fenix: false);
    GetInstanceAccess.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance, fenix: false);

    //NETWORK BINDING PROVIDER AND REPOSITORY
    GetInstanceAccess.lazyPut<NetworkProvider>(() => NetworkProvider(GetInstanceAccess.find()), fenix: false);
    GetInstanceAccess.lazyPut<NetworkRepository>(() => NetworkRepository(), fenix: false);

    //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
    GetInstanceAccess.lazyPut<GetStorage>(() => GetStorage(), fenix: false);
    GetInstanceAccess.lazyPut<Storage>(() => Storage(GetInstanceAccess.find()), fenix: false);

    //FIREBASE PROVIDER AND REPOSITORY
    GetInstanceAccess.lazyPut<FirebaseProvider>(() => FirebaseProvider(GetInstanceAccess.find(), GetInstanceAccess.find()), fenix: false);
    GetInstanceAccess.lazyPut<FirebaseRepository>(() => FirebaseRepository(), fenix: false);
  }

  //FIREBASE INIT
  void _initFireBase() async {
    await Firebase.initializeApp();
  }

  //DEVICE (MOBILE) INFORMATION
  void _deviceInformation() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Global.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }
  }

  _oneSignalInit() async {

  }
}
