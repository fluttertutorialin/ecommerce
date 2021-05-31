/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../controller/controller_package.dart';
import '../import_package.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<LoginController>(() => LoginController(
        GetInstanceAccess.find(),
        GetInstanceAccess.find()));
  }
}
