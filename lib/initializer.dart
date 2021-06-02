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
import 'shared/common/dio_helper.dart';
import 'shared/common/get_storage.dart';
import 'shared/common/global.dart';
import 'shared/provider/firebase_provider.dart';
import 'shared/provider/network_provider.dart';
import 'shared/repository/firebase_repository.dart';
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
      //_oneSignalInit();
    } catch (err) {
      rethrow;
    }
  }

  //GET STORAGE INIT
  _initGetStorage() async {
    await GetStorage.init();

    /// OPTIONAL STORAGE (CONTAINER) NAME
  }

  //SCREEN ORIENTATIONS INIT
  void _initScreenOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initLazyPut() {
    //DIO
    Get.lazyPut<DioHelper>(() => DioHelper(), fenix: false);

    //FIREBASE
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance, fenix: false);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance,
        fenix: false);

    //NETWORK BINDING
    Get.lazyPut<NetworkProvider>(() => NetworkProvider(Get.find()),
        fenix: false);
    Get.lazyPut<NetworkRepository>(() => NetworkRepository(), fenix: false);

    //LOCAL STORAGE SESSION
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: false);
    Get.lazyPut<Storage>(() => Storage(Get.find()), fenix: false);

    Get.lazyPut<FireBaseProvider>(() => FireBaseProvider());
    Get.lazyPut<FirebaseRepository>(
        () => FirebaseRepository(Get.find(), Get.find()),
        fenix: false);
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

  /*_oneSignalInit() async {
    bool allowed =
        await OneSignal.shared.promptUserForPushNotificationPermission();

    if (allowed) {
      await OneSignal.shared.init("c3c8eba8-fdd7-4d5a-935e-f479d48bd8bb");

      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

      OneSignal.shared
          .setNotificationReceivedHandler((OSNotification notification) {
        // will be called whenever a notification is received
      });

      OneSignal.shared
          .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
        // will be called whenever a notification is opened/button pressed.
      });

      OneSignal.shared
          .setPermissionObserver((OSPermissionStateChanges changes) {
        // will be called whenever the permission changes
        // (ie. user taps Allow on the permission prompt in iOS)
      });

      OneSignal.shared
          .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
        // will be called whenever the subscription changes
        //(ie. user gets registered with OneSignal and gets a user ID)
      });

      OneSignal.shared.setEmailSubscriptionObserver(
          (OSEmailSubscriptionStateChanges emailChanges) {
        // will be called whenever then user's email subscription changes
        // (ie. OneSignal.setEmail(email) is called and the user gets registered
      });

      OneSignal.shared.removeExternalUserId();
    }
  }*/
}
