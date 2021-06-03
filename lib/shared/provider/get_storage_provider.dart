/*
   DEVELOPED BY: KAMLESH LAKHANI
   LOCAL STORAGE SESSION MANAGE
*/

import 'package:get_storage/get_storage.dart';

class GetStorageProvider {
  final GetStorage _getStorage;

  GetStorageProvider(this._getStorage);

  //SESSION INSERT THE VALUE
  Future<void> saveValue(String key, dynamic value) =>
      _getStorage.writeIfNull(key, value);

  //SESSION GET THE VALUE
  T? getValue<T>(String key) => _getStorage.read<T>(key);

  //SESSION CHECK THE DATA IS AVAILABLE RETURN TRUE ELSE FALSE
  bool hasData(String key) => _getStorage.hasData(key);

  //SESSION SINGLE REMOVE
  Future<void> removeValue(String key) => _getStorage.remove(key);

  //SESSION CLEAR ALL DATA
  Future<void> clearStorage() => _getStorage.erase();
}
