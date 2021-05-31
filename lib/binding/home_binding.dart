/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../controller/controller_package.dart';
import '../import_package.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<HomeController>(() =>
        HomeController(GetInstanceAccess.find(), GetInstanceAccess.find()));
  }
}
