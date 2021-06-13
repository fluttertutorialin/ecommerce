import 'package:get/get.dart';

class BaseController extends GetxController {
  final isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }
}
