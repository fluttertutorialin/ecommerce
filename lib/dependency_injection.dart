import 'package:ecommerce/shared/repository/firebase_repository.dart';
import 'package:ecommerce/shared/repository/get_storage_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'shared/provider/firebase_provider.dart';
import 'shared/provider/get_storage_provider.dart';
import 'shared/provider/network_provider.dart';
import 'shared/common/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'shared/repository/network_repository.dart';

class DependencyInjection {
  void init() {
    //DIO HELPER
    Get.lazyPut<DioHelper>(() => DioHelper(), fenix: false);

    //FIREBASE
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance, fenix: false);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance, fenix: false);

    //NETWORK BINDING PROVIDER AND REPOSITORY
    Get.lazyPut<NetworkProvider>(() => NetworkProvider(Get.find()), fenix: false);
    Get.lazyPut<NetworkRepository>(() => NetworkRepository(), fenix: false);

    //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: false);

    Get.lazyPut<GetStorageProvider>(() => GetStorageProvider(Get.find()), fenix: false);
    Get.lazyPut<GetStorageRepository>(() => GetStorageRepository(), fenix: false);

    //FIREBASE PROVIDER AND REPOSITORY
    Get.lazyPut<FirebaseProvider>(() => FirebaseProvider(Get.find(), Get.find()), fenix: false);
    Get.lazyPut<FirebaseRepository>(() => FirebaseRepository(), fenix: false);
  }
}
