/*
   DEVELOPED BY: KAMLESH LAKHANI
   runApp BEFORE THE INITIALIZATION
*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
      _deviceInformation();

      _initGetStorage();
      _initScreenOrientations();
      _initFireBase();

      _initLazyPut();
    } catch (err) {
      rethrow;
    }
  }

  //GET STORAGE INIT
  _initGetStorage() async {
    await GetStorage.init(); /// OPTIONAL STORAGE (CONTAINER) NAME
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
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance, fenix: false);

    //NETWORK BINDING
    Get.lazyPut<NetworkProvider>(() => NetworkProvider(Get.find()), fenix: false);
    Get.lazyPut<NetworkRepository>(() => NetworkRepository(), fenix: false);

    //LOCAL STORAGE SESSION
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: false);
    Get.lazyPut<Storage>(() => Storage(Get.find()), fenix: false);

    Get.lazyPut<FireBaseProvider>(() => FireBaseProvider());
    Get.lazyPut<FirebaseRepository>(() => FirebaseRepository(Get.find(), Get.find()), fenix: false);
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
}
