import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/shared/provider/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository implements FireBaseProvider {
  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _fireStore;

  FirebaseRepository(this._firebaseAuth, this._fireStore);

  @override
  void loginFirebaseFacebook({token}) async {
    AuthCredential credential = FacebookAuthProvider.credential(token);
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<User?> loginFirebaseGoogle({String? idToken, String? accessToken}) async {
    AuthCredential authCredential = GoogleAuthProvider.credential(accessToken: accessToken, idToken: idToken);
    final UserCredential userCredential = await _firebaseAuth.signInWithCredential(authCredential);
    return userCredential.user;
  }

  @override
  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {}
  }

  @override
  void signOut() async {
    await _firebaseAuth.signOut();
  }

/*  void saveUserToFirestore({user}) async {
    await _fireStore.collection('users').doc(user!.email).set(
      {'deviceToken': '', 'isOnline': true},
      SetOptions(merge: true),
    );
  }*/
}
