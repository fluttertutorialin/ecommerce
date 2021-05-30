/*
   DEVELOPED BY: KAMLESH LAKHANI
   LOCAL STORAGE SESSION MANAGE
*/
import 'package:get_storage/get_storage.dart';

class Storage {
  GetStorage _getStorage;
  Storage(this._getStorage);

  get getStorage => _getStorage;

  Future<void> saveValue(String key, dynamic value) =>
      _getStorage.writeIfNull(key, value);

  T? getValue<T>(String key) => _getStorage.read<T>(key);

  bool hasData(String key) => _getStorage.hasData(key);

  Future<void> removeValue(String key) => _getStorage.remove(key);

  Future<void> clearStorage() => _getStorage.erase();
}
