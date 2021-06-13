/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../shared/provider/get_storage_provider.dart';
import 'package:get_storage/get_storage.dart';
import '../shared/repository/get_storage_repository.dart';
import '../controller/controller_package.dart' show SplashController;
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    //LOCAL STORAGE SESSION PROVIDER AND REPOSITORY
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: false);

    Get.lazyPut<GetStorageProvider>(() => GetStorageRepository(Get.find()), fenix: false);

    Get.lazyPut<SplashController>(() => SplashController(Get.find()));
  }
}
