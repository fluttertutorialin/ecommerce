/*
   DEVELOPED BY: KAMLESH LAKHANI

   StateMixin
   ----------
   controller.obx(
        (data) => ListView(children: [
              ...data
                  .map((value) => CustomItemHome(homeResponse: value))
                  .toList()
            ]),
        onLoading:  circularProgressIndicator(),
        onError: (error) => Center(child: Text(error)))

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();

    _networkRepository.getMethod(
        baseUrl: Strings.postUrl,
        success: (value) {
          _statusProgressBarRx.value = StatusProgressBar.SUCCESS;

          var listAsConvert = value as List;
          List<HomeResponse> _homeListFromJson = listAsConvert.map((i) => HomeResponse.fromJson(i)).toList();
          change(_homeListFromJson, status: RxStatus.success());
        },
        error: (error) {
          change(null, status: RxStatus.error(err.toString()),);
        });
  }
}
*/

import '../base/base_controller.dart';
import '../model/get/home/home_response.dart';
import '../import_package.dart';

class HomeController extends BaseController {
  //GET THE DATA API STORE THE DATA RX-LIST
  final _homeListRx = <HomeResponse>[].obs; // SET DATA

  get homeList => _homeListRx; // GET DATA

  @override
  void onInit() {
    super.onInit();

    _postResponseApi();
  }

  //API CALL
  _postResponseApi() {
    getAPI(success: (value) {
      //STRING CONVERT JSON MODEL CLASS
      //final List<HomeResponse> _homeListFromJson = value?.map<HomeResponse>((u) => HomeResponse.fromJson(u),)?.toList();
      _homeListRx.value = homeResponseWithoutDecode(value);
    }, error: (error) {
      //error.toast();
    });
  }

  //LOGOUT
  applicationLogout() {
    logout();
  }
}
