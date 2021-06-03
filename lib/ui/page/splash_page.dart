/*
   DEVELOPED BY: KAMLESH LAKHANI

   GetView - STATLESS WIDGET
   GetWidget - STATEFULL WIDGET
*/

import '../../controller/controller_package.dart';
import '../../import_package.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Center(
            child: Text(controller.appName!,
                style: AppTextStyle.splashTitleStyle)));
  }
}
