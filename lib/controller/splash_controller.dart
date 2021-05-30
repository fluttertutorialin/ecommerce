/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import 'package:ecommerce/import_package.dart';

class SplashController extends GetxController {
  String? appName;
  late Storage _storage;

  SplashController(this._storage);

  @override
  void onInit() {
    super.onInit();
    appName = Strings.appName;

    //TODO TESTING FOR LOGIN SESSION TRUE
    _storage.saveValue(StringsSession.isLoginSession, true);

    _launchPage();
  }

  _launchPage() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    bool isLogin = _storage.hasData(StringsSession.isLoginSession);

    //OFFALLNAME FOR CLEAR BACK SCREEN
    Get.offAllNamed(isLogin ? AppRoute.HOME : AppRoute.LOGIN);
  }
}
