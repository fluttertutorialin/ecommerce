/*
   DEVELOPED BY: KAMLESH LAKHANI
   LOCAL STORAGE SESSION MANAGE
*/

abstract class GetStorageProvider {

  //SESSION INSERT THE VALUE
  Future<void> saveValue(String key, dynamic value);

  //SESSION GET THE VALUE
  T? getValue<T>(String key);

  //SESSION CHECK THE DATA IS AVAILABLE RETURN TRUE ELSE FALSE
  bool hasData(String key);

  //SESSION SINGLE REMOVE
  Future<void> removeValue(String key);

  //SESSION CLEAR ALL DATA
  Future<void> clearStorage();
}
