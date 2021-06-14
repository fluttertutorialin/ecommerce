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
        IconButton(onPressed: () => controller.logout(), icon: IconFont.logout)
      ]),
      body: Obx(() => controller.isLoading
          ? circularProgressIndicator()
          : controller.error != ''
              ? Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text(controller.error,
                          style: AppTextStyle.errorStyle)))
              : ListView(children: [
                  ...controller.homeList
                      .map((value) => CustomItemHome(homeResponse: value))
                      .toList()
                ])));
}
