import 'package:ecommerce/shared/provider/get_storage_provider.dart';
import 'package:ecommerce/shared/repository/network_repository.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final isLoading = false.obs;
  late NetworkRepository networkRepository;
  late GetStorageProvider getStorageProvider;

  @override
  onInit() {
    super.onInit();
    networkRepository = Get.find();
    getStorageProvider = Get.find();

  }

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }
}
