/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR FIREBASE SERVICE
*/

import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseProvider {
  dynamic getCurrentUser() => null;

  /// Login Firebase with social account
  void loginFirebaseFacebook({token});
  Future<User?> loginFirebaseGoogle({String? idToken, String? accessToken});

  void updateUser({required user});
  void signOut();
}
