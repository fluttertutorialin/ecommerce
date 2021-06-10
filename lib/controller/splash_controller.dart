/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import '../import_package.dart';

class SplashController extends GetxController {
  late String? appName;
  late final GetStorageRepository _getStorageRepository;

  SplashController(this._getStorageRepository);

  @override
  void onInit() {
    super.onInit();
    appName = ValueString.appName;

    _launchPage();
  }

  _launchPage() async {
    //SPLASH SCREEN WAIT 3 SECOND
    await ValueString.splashScreenWait.seconds.delay().then((value) {
      final bool? isLogin = _getStorageRepository.hasData(SessionString.isLoginSession);

      //FOR CLEAR SPLASH SCREEN AND CHANGE THE PAGE HOME
      isLogin! ? AppRoute.HOME.offAllNamed() : AppRoute.LOGIN.offAllNamed();
    });
  }
}
