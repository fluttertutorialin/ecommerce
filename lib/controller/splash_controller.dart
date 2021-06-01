/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import '../import_package.dart';

class SplashController extends GetxController {
  String? appName;
  late Storage _storage;

  SplashController(this._storage);

  @override
  void onInit() {
    super.onInit();
    appName = ValueString.appName;

    //TODO TESTING FOR LOGIN SESSION TRUE
    _storage.saveValue(SessionString.isLoginSession, false);

    _launchPage();
  }

  _launchPage() async {
    await Future.delayed(const Duration(seconds: 3));
    bool isLogin = _storage.hasData(SessionString.isLoginSession);

    //FOR CLEAR SPLASH SCREEN AND CHANGE THE PAGE HOME
    isLogin ? AppRoute.HOME.offAllNamed() : AppRoute.LOGIN.offAllNamed();
  }
}
