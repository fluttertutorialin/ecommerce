/*
   DEVELOPED BY: KAMLESH LAKHANI
   completer_ex: This library period call the api. For example every 10 second
*/

import 'dart:async';
import '../resource/strings/server_string.dart';
import '../shared/provider/get_storage_provider.dart';
import '../shared/repository/network_repository.dart';
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
