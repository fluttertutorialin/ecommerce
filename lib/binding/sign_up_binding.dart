/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../controller/controller_package.dart';
import '../import_package.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<SignUpController>(() => SignUpController(
        GetInstanceAccess.find()));
  }
}
