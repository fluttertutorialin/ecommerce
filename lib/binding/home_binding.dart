/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/shared/common/dio_helper.dart';
import 'package:ecommerce/shared/provider/firebase_provider.dart';
import 'package:ecommerce/shared/provider/get_storage_provider.dart';
import 'package:ecommerce/shared/provider/network_provider.dart';
import 'package:ecommerce/shared/repository/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

import '../shared/repository/get_storage_repository.dart';
import '../shared/repository/network_repository.dart';
import 'package:get/get.dart';
import '../controller/controller_package.dart' show HomeController;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //DIO HELPER
    Get.lazyPut<DioHelper>(() => Get.find<DioHelper>(), fenix: false);

    //FIREBASE
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance, fenix: false);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance, fenix: false);

    //NETWORK BINDING PROVIDER AND REPOSITORY
    Get.lazyPut<NetworkProvider>(() => NetworkProvider(Get.find()), fenix: false);
    Get.lazyPut<NetworkRepository>(() => NetworkRepository(), fenix: false);

    //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
    Get.lazyPut<GetStorage>(() => Get.find<GetStorage>(), fenix: false);

    Get.lazyPut<GetStorageProvider>(() => GetStorageProvider(Get.find()), fenix: false);
    Get.lazyPut<GetStorageRepository>(() => GetStorageRepository(), fenix: false);

    //FIREBASE PROVIDER AND REPOSITORY
    Get.lazyPut<FirebaseProvider>(() => FirebaseProvider(Get.find(), Get.find()), fenix: false);
    Get.lazyPut<FirebaseRepository>(() => FirebaseRepository(), fenix: false);

    //CONTROLLER
    Get.lazyPut<HomeController>(() => HomeController(Get.find(), Get.find()));
  }
}
