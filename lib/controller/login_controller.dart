import 'package:ecommerce/import_package.dart';
import 'package:ecommerce/shared/repository/firebase_repository.dart';
import 'package:ecommerce/shared/repository/network_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  late NetworkRepository _networkRepository;
  late Storage _storage;
  late FirebaseRepository _firebaseRepository;

  User? user;

  LoginController(this._networkRepository, this._storage, this._firebaseRepository);

  //LOGIN BY FACEBOOK
  Future<void> loginFB({Function? success, Function? fail, context}) async {
    try {
      final result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final accessToken = await FacebookAuth.instance.accessToken;
          _firebaseRepository.loginFirebaseFacebook(token: accessToken!.token);
          success!(user);
          break;

        case LoginStatus.cancelled:
          fail!(Strings.loginCancelToast);
          break;
        default:
          break;
      }
    } catch (error) {
      fail!(error);
    }
  }

  //LOGIN BY GOOGLE
  Future<void> loginGoogle({Function? success, Function? fail, context}) async {
    try {
      var _googleSignIn = GoogleSignIn(scopes: ['email']);
      var _signIn = await _googleSignIn.signIn();

      if (_signIn == null) {
        fail!(Strings.loginCancelToast);
      } else {
        var auth = await _signIn.authentication;
        _firebaseRepository.loginFirebaseGoogle(token: auth.accessToken);

        success!(user);
      }
    } catch (error) {
      fail!(error.toString());
    }
  }
}