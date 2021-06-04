/*
   DEVELOPED BY: KAMLESH LAKHANI
*/
import 'package:get/get.dart';
import '../controller/controller_package.dart' show HomeController;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //CONTROLLER
    Get.lazyPut<HomeController>(() => HomeController(Get.find(), Get.find()));
  }
}
