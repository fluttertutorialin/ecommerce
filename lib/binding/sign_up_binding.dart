/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:get/get.dart';
import '../controller/controller_package.dart' show SignUpController;

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController(Get.find(), Get.find()));
  }
}
