/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR FIREBASE SERVICE
*/

import 'package:ecommerce/import_package.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository implements FirebaseProvider {
  final _firebaseProvider = Get.find<FirebaseProvider>();

  @override
  Stream<User?> authStateChange() {
    return _firebaseProvider.authStateChange();
  }

  @override
  User? getCurrentUser() {
    return _firebaseProvider.getCurrentUser();
  }

  @override
  void loginFirebaseFacebook({token}) {
    _firebaseProvider.loginFirebaseFacebook(token: token);
  }

  @override
  Future<User?> loginFirebaseGoogle({String? idToken, String? accessToken}) {
    return _firebaseProvider.loginFirebaseGoogle(idToken: idToken, accessToken: accessToken);
  }

  @override
  void signOut() {
    _firebaseProvider.signOut();
  }

  @override
  void updateUser({required user}) {
    return _firebaseProvider.updateUser(user: user);
  }

}
