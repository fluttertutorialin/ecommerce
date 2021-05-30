/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../controller/controller_package.dart';
import '../import_package.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<SplashController>(() => SplashController(GetInstanceAccess.find()));
  }
}
