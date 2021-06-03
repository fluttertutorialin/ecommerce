/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:get/get.dart';
import '../provider/get_storage_provider.dart';

class GetStorageRepository  {
  final _getStorageProvider = Get.find<GetStorageProvider>();


  Future<void> clearStorage() {
    return _getStorageProvider.clearStorage();
  }

  T? getValue<T>(String key) {
    return _getStorageProvider.getValue(key);
  }

  bool hasData(String key) {
    return _getStorageProvider.hasData(key);
  }

  Future<void> removeValue(String key) {
    return _getStorageProvider.removeValue(key);
  }

  Future<void> saveValue(String key, value) {
    return _getStorageProvider.saveValue(key, value);
  }
}
