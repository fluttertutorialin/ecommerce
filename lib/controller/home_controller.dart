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

import '../model/get/home/home_response.dart';
import '../import_package.dart';
import '../shared/repository/network_repository.dart';

class HomeController extends GetxController {
  late final NetworkRepository _networkRepository;
  late final Storage _storage;

  HomeController(this._networkRepository, this._storage);

  // PROGRESSBAR
  final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
  get statusProgressBar => _statusProgressBarRx.value; //GET DATA

  //FROM API DATA STORE AND GET LIST
  var _homeListRx = RxList<HomeResponse>([]); // SET DATA
  get homeList => _homeListRx; // GET DATA

  @override
  void onInit() {
    super.onInit();

    _postResponseApi();
  }

  //API CALL
  _postResponseApi() {
    _statusProgressBarRx.value = StatusProgressBar.LOADING;

    //CURRENT USER ID
    _storage.getValue(SessionString.userIdSession);

    _networkRepository.getMethod(
        baseUrl: ServerString.postUrl,
        success: (value) {
          _statusProgressBarRx.value = StatusProgressBar.SUCCESS;

          //STRING CONVERT JSON MODEL CLASS
          //final List<HomeResponse> _homeListFromJson = value?.map<HomeResponse>((u) => HomeResponse.fromJson(u),)?.toList();
          final List<HomeResponse> _homeListFromJson = homeResponseWithoutDecode(value);

          _homeListRx.value = _homeListFromJson;
        },
        error: (error) {
          _statusProgressBarRx.value = StatusProgressBar.SUCCESS;
        });
  }
}
