/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import '../shared/common/dio_helper.dart';
import '../shared/provider/firebase_provider.dart';
import '../shared/provider/get_storage_provider.dart';
import '../shared/provider/network_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import '../shared/repository/firebase_repository.dart';
import '../shared/repository/get_storage_repository.dart';
import '../shared/repository/network_repository.dart';
import 'package:get/get.dart';
import '../controller/controller_package.dart' show LoginController;

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    //FIREBASE
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);

    //NETWORK BINDING PROVIDER AND REPOSITORY
    Get.lazyPut<NetworkProvider>(() => NetworkProvider(Get.find()));
    Get.lazyPut<NetworkRepository>(() => NetworkRepository());

    //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
    Get.lazyPut<GetStorage>(() => GetStorage());

    Get.lazyPut<GetStorageProvider>(() => GetStorageProvider(Get.find()));
    Get.lazyPut<GetStorageRepository>(() => GetStorageRepository());

    //FIREBASE PROVIDER AND REPOSITORY
    Get.lazyPut<FirebaseProvider>(() => FirebaseProvider(Get.find(), Get.find()));
    Get.lazyPut<FirebaseRepository>(() => FirebaseRepository());

    Get.lazyPut<LoginController>(() => LoginController(Get.find(), Get.find(), Get.find()));
  }
}
