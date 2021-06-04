/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:get/get.dart';
import '../controller/controller_package.dart' show LoginController;

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find(), Get.find(), Get.find()));
  }
}
