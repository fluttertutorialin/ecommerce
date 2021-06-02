import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseProvider  {
  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _fireStore;

  FirebaseProvider(this._firebaseAuth, this._fireStore);


  void loginFirebaseFacebook({token}) async {
    AuthCredential credential = FacebookAuthProvider.credential(token);
    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<User?> loginFirebaseGoogle(
      {String? idToken, String? accessToken}) async {
    AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: accessToken, idToken: idToken);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    return userCredential.user;
  }

  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {}
  }

  void signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStateChange() {
    return _firebaseAuth.authStateChanges();
  }

  void updateUser({required user}) async {
    await _fireStore
        .collection('users')
        .doc(user!.email)
        .set({'deviceToken': '', 'isOnline': true}, SetOptions(merge: true))
        .then((value) {})
        .catchError((error) {});
  }

/*   Future<String> postFile(
      {required File imageFile,
        required String folderPath,
        required String fileName}) async {
    Reference reference = FirebaseStorage.instance.ref().child(folderPath).child(fileName);
    TaskSnapshot storageTaskSnapshot = await reference.putFile(imageFile);
    String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadURL;
  }*/
}
