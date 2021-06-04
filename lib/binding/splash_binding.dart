/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../controller/controller_package.dart' show SplashController;
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(Get.find()));
  }
}
