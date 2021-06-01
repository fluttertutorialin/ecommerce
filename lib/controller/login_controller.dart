import 'package:ecommerce/import_package.dart';
import 'package:ecommerce/model/sent/sent_package.dart' show LoginParameter;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  late NetworkRepository _networkRepository;
  late Storage _storage;
  late FirebaseRepository _firebaseRepository;

  User? user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginController(this._networkRepository, this._firebaseRepository);

  Rxn<User> _firebaseUser = Rxn<User>();
  String? get email => _firebaseUser.value?.email;

  //PAGE LAUNCH FIRST SCROLL
  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_firebaseRepository.authStateChange());
  }

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
      final GoogleSignInAccount? _signIn = await _googleSignIn.signIn();

      if (_signIn == null) {
        fail!(Strings.loginCancelToast);
      } else {
        var auth = await _signIn.authentication;
        _firebaseRepository
            .loginFirebaseGoogle(
                idToken: auth.idToken, accessToken: auth.accessToken)
            .then((value) {
          _firebaseRepository.updateUser(user: value);
          success!(value);
        });
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'account-exists-with-different-credential') {
      } else if (error.code == 'invalid-credential') {}
    } catch (error) {
      fail!(error.toString());
    }
  }

  //LOGIN BY APPLICATION
  loginApplication() async {
    var loginParameter = LoginParameter(
      email: emailController.value.text,
      password: passwordController.value.text.duSHA256());

    // SENT API PARAMETER (FOR EXAMPLE BODY) JSON FORMAT
    loginParameter.toJson();

    //LOGIN SUCCESS GO TO MAIN SCREEN
    AppRoute.HOME.changeScreen();
  }

  //CLEAR RESOURCE
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
