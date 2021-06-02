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
*/

import 'binding/splash_binding.dart' show SplashBinding;
import 'import_package.dart';
import 'initializer.dart';
import 'lang/translation_service.dart';

void main() {
  //APPLICATION RUN AND INIT THE INSTANCE
  Initializer.instance.init(() {
    runApp(MyApp());
  });
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
        initialBinding: SplashBinding(),
        initialRoute: AppRoute.SPLASH,

        defaultTransition: Transition.fade,

        enableLog: true,
        navigatorKey: Get.key,


        //FOR COLLECTION OF APPLICATION PAGES
        getPages: AppPage.routes);
  }
}
