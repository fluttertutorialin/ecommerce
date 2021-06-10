/*
   DEVELOPED BY: KAMLESH LAKHANI
   START THE APPLICATION

   //GETxSERVICE USE ASYNC
  class AppSpController extends GetxService {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance(); }}

   //ACCESS SHAREDPREFERENCES
   var sp = Get.find<SharedPreferences>();

   //ADD INITIALIZER
    await Get.putAsync(() => AppSpController().init());

    //WIDGET FUNCTION
    final Widget Function(String token) _builder;
    @override
    Widget build(BuildContext context) {
    return widget._builder(_token);
  }
*/

import 'package:device_info/device_info.dart';
import 'package:ecommerce/app_binding.dart';
import 'package:flutter_config/flutter_config.dart';
import 'shared/common/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'import_package.dart';
import 'lang/translation_service.dart';

Future<void> main() async {
  //APPLICATION RUN AND INIT THE INSTANCE
  WidgetsFlutterBinding.ensureInitialized();

  //APPLICATION PORTRAIT MODE
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.kPrimaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark));

  //INIT
  await GetStorage.init();
  await Firebase.initializeApp();
  await FlutterConfig.loadEnvVariables();

  //DEVICE INFORMATION
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (Global.isIOS) {
    Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  } else {
    Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  }

  //FIREBASE NOTIFICATION
  /*await FirebaseNotification.initializeFCM(
      onNotificationPressed: (Map<String, dynamic> data) {
        print(data);
      },
      onTokenChanged: (String? token) {
        print(token);
      },
      icon: 'icon');*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      designSize: Get.size,
    );

    return GetMaterialApp(
        // FOR THEME, TITLE, BANNER TOP FALSE
        title: ValueString.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,

        //FOR LANGUAGE TRANSLATION
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),

        //FOR FIRST CALL THE SPLASH AND BINDING
        initialBinding: AppBinding(),
        initialRoute: AppRoute.SPLASH,
        defaultTransition: Transition.fade,
        enableLog: true,
        navigatorKey: Get.key,

        //FOR COLLECTION OF APPLICATION PAGES
        getPages: AppPage.routes);
  }
}
