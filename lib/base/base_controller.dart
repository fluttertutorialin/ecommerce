/*
   DEVELOPED BY: KAMLESH LAKHANI
   completer_ex: This library period call the api. For example every 10 second
*/

import '../shared/provider/network_provider.dart';
import '../resource/strings/server_string.dart';
import '../shared/provider/get_storage_provider.dart';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  final _isLoadingRx = false.obs;
  Rx<String?> _errorRx = ''.obs;

  get isLoading => _isLoadingRx;
  get error => _errorRx;

  final NetworkProvider networkProvider = Get.find();
  final GetStorageProvider getStorageProvider = Get.find();

  @override
  onInit() {
    super.onInit();
  }

  getMethod<T>({required Function success, required Function error}) {
    _showLoading();
    _errorRx.value = '';

    networkProvider
        .getMethod(baseUrl: ServerString.postUrl)
        .then((data) => data.fold((l) {
              _hideLoading();
              _errorRx.value = l.message;

              error(l.message);
            }, (r) {
              _hideLoading();
              success(r);
            }));
  }

  _showLoading() {
    _isLoadingRx.value = true;
  }

  _hideLoading() {
    _isLoadingRx.value = false;
  }
}
