/*
   DEVELOPED BY: KAMLESH LAKHANI
   completer_ex: This library period call the api. For example every 10 second
*/

import 'dart:async';
import 'package:ecommerce/import_package.dart';
export 'package:ecommerce/util/extensions.dart';
import '../resource/strings/server_string.dart';
import '../shared/provider/get_storage_provider.dart';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  final isLoading = false.obs;
  final NetworkProvider networkProvider = Get.find();
  final GetStorageProvider getStorageProvider = Get.find();

  @override
  onInit() {
    super.onInit();
  }

  getMethod<T>({required Function success, required Function error}) {
    showLoading();

    networkProvider
        .getMethod(baseUrl: ServerString.postUrl)
        .then((data) => data.fold((l) {
              hideLoading();
              error(l.message);
            }, (r) {
              hideLoading();
              success(r);
            }));
  }

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }
}
