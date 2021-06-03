/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../shared/common/get_instance_access.dart';
import 'package:get/get.dart' show Bindings;
import '../controller/controller_package.dart' show HomeController;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<HomeController>(() =>
        HomeController(GetInstanceAccess.find(), GetInstanceAccess.find()));
  }
}
