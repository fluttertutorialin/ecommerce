import 'dart:async';
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

  Future<T> homeApi() {
    showLoading();
    final completer = Completer<T>();

    networkRepository.getMethod(
        baseUrl: ServerString.postUrl,
        success: (value) {
          hideLoading();
          completer.complete(value);
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
