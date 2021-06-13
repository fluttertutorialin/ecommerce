/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../import_package.dart';
import '../shared/provider/firebase_provider.dart';
import '../controller/controller_package.dart' show LoginController;

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    //FIREBASE
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);

    //NETWORK BINDING PROVIDER AND REPOSITORY
    Get.lazyPut<NetworkProvider>(() => NetworkRepository(Get.find()), fenix: false);

    //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
    Get.lazyPut<GetStorage>(() => GetStorage());

    Get.lazyPut<GetStorageProvider>(() => GetStorageRepository(Get.find()), fenix: false);

    //FIREBASE PROVIDER AND REPOSITORY
    Get.lazyPut<FirebaseProvider>(() => FirebaseProvider(Get.find(), Get.find()));
    Get.lazyPut<FirebaseRepository>(() => FirebaseRepository());

    Get.lazyPut<LoginController>(() => LoginController());
  }
}
