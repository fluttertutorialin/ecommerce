/*
   DEVELOPED BY: KAMLESH LAKHANI
   completer_ex: This library period call the api. For example every 10 second
*/

import 'dart:async';
import 'package:ecommerce/import_package.dart';

import '../resource/strings/server_string.dart';
import '../shared/provider/get_storage_provider.dart';
import '../shared/repository/network_repository.dart';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  final isLoading = false.obs;
  late NetworkProvider networkProvider;
  late GetStorageProvider getStorageProvider;

  @override
  onInit() {
    super.onInit();
    networkProvider = Get.find();
    getStorageProvider = Get.find();
  }

  Future<T> getMethod() {
    showLoading();
    final completer = Completer<T>();

    networkProvider.getMethod(baseUrl: ServerString.postUrl).then((value) {
      value.fold((l) {
        hideLoading();
        completer.completeError(l.message!);
      }, (r) {
        hideLoading();
        completer.complete(r);
      });
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
