/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../import_package.dart';
import '../shared/provider/firebase_provider.dart';
import '../controller/controller_package.dart' show HomeController;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //FIREBASE
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance, fenix: false);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance, fenix: false);

    //NETWORK BINDING PROVIDER AND REPOSITORY
    Get.lazyPut<NetworkProvider>(() => NetworkProvider(Get.find()), fenix: false);
    Get.lazyPut<NetworkRepository>(() => NetworkRepository(), fenix: false);

    //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: false);

    Get.lazyPut<GetStorageProvider>(() => GetStorageRepository(Get.find()), fenix: false);

    //FIREBASE PROVIDER AND REPOSITORY
    Get.lazyPut<FirebaseProvider>(() => FirebaseProvider(Get.find(), Get.find()), fenix: false);
    Get.lazyPut<FirebaseRepository>(() => FirebaseRepository(), fenix: false);

    //CONTROLLER
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
