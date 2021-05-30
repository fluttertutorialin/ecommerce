import '../controller/controller_package.dart';
import 'package:ecommerce/import_package.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    GetInstanceAccess.lazyPut<SplashController>(() => SplashController());
  }
}
