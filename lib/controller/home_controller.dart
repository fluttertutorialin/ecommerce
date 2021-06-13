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

import 'package:ecommerce/base/base_controller.dart';
import 'package:ecommerce/resource/strings/session_string.dart';
import 'package:ecommerce/shared/provider/get_storage_provider.dart';

import '../model/get/home/home_response.dart';
import '../import_package.dart';

class HomeController extends BaseController {
  late final NetworkRepository _networkRepository;
  late final GetStorageProvider getStorageProvider;

  HomeController(this.getStorageProvider, this._networkRepository);

  //FROM API DATA STORE AND GET LIST
  final _homeListRx = <HomeResponse>[].obs; // SET DATA
  get homeList => _homeListRx; // GET DATA

  @override
  void onInit() {
    super.onInit();

    _postResponseApi();
  }

  //API CALL
  _postResponseApi() {
    showLoading();

    //CURRENT USER ID
    getStorageProvider.getValue(SessionString.userIdSession);

    _networkRepository.getMethod(
      baseUrl: ServerString.postUrl,
        success: (value) {
          hideLoading();

          //STRING CONVERT JSON MODEL CLASS
          //final List<HomeResponse> _homeListFromJson = value?.map<HomeResponse>((u) => HomeResponse.fromJson(u),)?.toList();
          final List<HomeResponse> _homeListFromJson =
              homeResponseWithoutDecode(value);

          _homeListRx.value = _homeListFromJson;
        },
        error: (error) {
          hideLoading();
        });
  }

  //LOGOUT
  logout() {
    getStorageProvider.removeValue(SessionString.isLoginSession);
    getStorageProvider.removeValue(SessionString.userIdSession);
    getStorageProvider.removeValue(SessionString.userNameSession);
    getStorageProvider.removeValue(SessionString.emailSession);

    //LOGIN NAVIGATION
    AppRoute.LOGIN.offAllNamed();
  }
}
