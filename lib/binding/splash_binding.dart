/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../shared/common/get_instance_access.dart';
import '../controller/controller_package.dart' show SplashController;
import 'package:get/get.dart' show Bindings;

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<SplashController>(() => SplashController(GetInstanceAccess.find()));
  }
}
