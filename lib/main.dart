/*
   DEVELOPED BY: KAMLESH LAKHANI
   START THE APPLICATION
*/

import 'import_package.dart';
import 'initializer.dart';

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
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoute.HOME,
      getPages: AppPage.routes,
    );
  }
}

