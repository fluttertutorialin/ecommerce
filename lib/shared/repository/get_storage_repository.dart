/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../provider/get_storage_provider.dart';

class GetStorageRepository implements GetStorageProvider{
  final GetStorage _getStorage;

  GetStorageRepository(this._getStorage);

  @override
  Future<void> clearStorage() {
    return _getStorage.erase();
  }

  @override
  T? getValue<T>(String key) {
    return _getStorage.read(key);
  }

  @override
  bool hasData(String key) {
    return _getStorage.hasData(key);
  }

  @override
  Future<void> removeValue(String key) {
    return _getStorage.remove(key);
  }

  @override
  Future<void> saveValue(String key, value) {
    return _getStorage.writeIfNull(key, value);
  }
}
