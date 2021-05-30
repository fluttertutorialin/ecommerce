/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import '../../controller/controller_package.dart';
import '../../import_package.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(controller.appName!,
                style: AppTextStyle.splashTitleStyle)));
  }
}
