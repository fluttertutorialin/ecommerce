/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR FIREBASE SERVICE
*/

import 'package:firebase_auth/firebase_auth.dart';

class FireBaseProvider {
  dynamic getCurrentUser() => null;

  /// Login Firebase with social account
  void loginFirebaseFacebook({token}) {}
  Future<User?> loginFirebaseGoogle(
      {String? idToken, String? accessToken}) async {}

  void updateUser({required user}) {}
  void signOut() {}
}
