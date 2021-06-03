/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../shared/common/get_instance_access.dart';
import 'package:get/get.dart' show Bindings;
import '../controller/controller_package.dart' show LoginController;

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<LoginController>(() => LoginController(
        GetInstanceAccess.find(),
        GetInstanceAccess.find()));
  }
}
