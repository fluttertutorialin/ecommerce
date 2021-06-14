/*
   DEVELOPED BY: KAMLESH LAKHANI
   completer_ex: This library period call the api. For example every 10 second
*/

import '../shared/provider/network_provider.dart';
import '../resource/strings/server_string.dart';
import '../shared/provider/get_storage_provider.dart';
import 'package:get/get.dart';
import 'package:ecommerce/util/extensions.dart';

class BaseController<T> extends GetxController {
  final _isLoadingRx = false.obs;
  get isLoading => _isLoadingRx.value;
  final _errorRx = ''.obs;
  get error => _errorRx.value;

  final NetworkProvider networkProvider = Get.find();
  final GetStorageProvider getStorageProvider = Get.find();

  @override
  onInit() {
    super.onInit();
  }

  getMethod(
      {required Function success, required Function(String? error) error}) {
    _isLoadingRx.value = true;

    networkProvider.getMethod(baseUrl: ServerString.postUrl).futureValue((value) {
      _isLoadingRx.value = false;
      success(value);
    }, onError: ((value) {
      _isLoadingRx.value = false;
      _errorRx.value = value!;
      error(value);
    }));
  }
}
