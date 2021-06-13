import 'package:ecommerce/import_package.dart';
import 'package:ecommerce/model/get/home/home_response.dart';
import 'package:ecommerce/resource/strings/server_string.dart';
import 'package:ecommerce/shared/provider/get_storage_provider.dart';
import 'package:ecommerce/shared/repository/network_repository.dart';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  final isLoading = false.obs;
  late NetworkRepository networkRepository;
  late GetStorageProvider getStorageProvider;

  @override
  onInit() {
    super.onInit();
    networkRepository = Get.find();
    getStorageProvider = Get.find();
  }

  Future<List<HomeResponse>> homeApi() {
    showLoading();
    final completer = Completer<List<HomeResponse>>();

    networkRepository.getMethod(
        baseUrl: ServerString.postUrl,
        success: (value) {
          hideLoading();
          completer.complete(homeResponseWithoutDecode(value));
        },
        error: (error) {
          hideLoading();
          completer.completeError(error);
        });
    return completer.future;
  }

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }
}
