/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import '../widget/custom_appbar_widget.dart';
import '../widget/custom_item_home.dart';
import '../../controller/controller_package.dart';
import '../../import_package.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar:
          CustomAppbarWidget(title: 'Home', showBackButton: false, actions: [
        IconButton(
            onPressed: () =>controller.logout(),
            icon: IconFont.logout)
      ]),
      body: Obx(() => controller.statusProgressBar == StatusProgressBar.LOADING
          ? circularProgressIndicator()
          : ListView(children: [
              ...controller.homeList
                  .map((value) => CustomItemHome(homeResponse: value))
                  .toList()
            ])));
}
