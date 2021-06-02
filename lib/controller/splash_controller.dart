/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import '../import_package.dart';

class SplashController extends GetxController {
  late String? appName;
  late final Storage _storage;

  SplashController(this._storage);

  @override
  void onInit() {
    super.onInit();
    appName = ValueString.appName;

    _launchPage();
  }

  _launchPage() async {
    //SPLASH SCREEN WAIT 3 SECOND
    await Future.delayed(const Duration(seconds: ValueString.splashScreenWait)).then((value) {
      final bool? isLogin = _storage.hasData(SessionString.isLoginSession);

      //FOR CLEAR SPLASH SCREEN AND CHANGE THE PAGE HOME
      isLogin! ? AppRoute.LOGIN.offAllNamed() : AppRoute.LOGIN.offAllNamed();
    });
  }
}
