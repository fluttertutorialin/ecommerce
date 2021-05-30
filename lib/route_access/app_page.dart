/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR ROUTE MANAGE
*/

import '../ui/page/page_package.dart';
import '../binding/binding_package.dart';
import 'package:get/route_manager.dart';
part 'app_route.dart';

class AppPage {
  AppPage._();

  static final routes = [
    GetPage(
        name: AppRoute.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),

    GetPage(
        name: AppRoute.HOME,
        page: () => HomePage(),
        binding: HomeBinding()),

    GetPage(
        name: AppRoute.LOGIN,
        page: () => LoginPage()),
  ];
}
