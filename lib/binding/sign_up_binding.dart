/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../shared/common/get_instance_access.dart';
import 'package:get/get.dart' show Bindings;
import '../controller/controller_package.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<SignUpController>(() => SignUpController(
        GetInstanceAccess.find()));
  }
}
