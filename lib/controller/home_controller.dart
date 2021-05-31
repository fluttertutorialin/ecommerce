/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import '../model/get/home/home_response.dart';
import '../import_package.dart';
import '../shared/repository/network_repository.dart';

class HomeController extends GetxController {
  late NetworkRepository _networkRepository;
  late Storage _storage;

  HomeController(this._networkRepository, this._storage);

  // PROGRESSBAR
  final statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
  get statusProgressBar => statusProgressBarRx.value; //GET DATA

  //FROM API DATA STORE AND GET LIST
  var homeListRx = RxList<HomeResponse>([]); // SET DATA
  get homeList => homeListRx; // GET DATA

  @override
  void onInit() {
    super.onInit();

    _postResponseApi();
  }

  //API CALL
  _postResponseApi() {
    statusProgressBarRx.value = StatusProgressBar.LOADING;

    _networkRepository.getMethod(
        baseUrl: Strings.postUrl,
        success: (value) {
          statusProgressBarRx.value = StatusProgressBar.SUCCESS;

          var list = value as List;
          List<HomeResponse> _homeListFromJson = list.map((i) => HomeResponse.fromJson(i)).toList();
          homeListRx.value = _homeListFromJson;
        },
        error: (error) {
          statusProgressBarRx.value = StatusProgressBar.SUCCESS;
        });
  }
}
