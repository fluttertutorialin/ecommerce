import 'package:ecommerce/import_package.dart';
import 'package:ecommerce/model/sent/sent_package.dart' show LoginParameter;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  late NetworkRepository _networkRepository;
  late Storage _storage;
  late FirebaseRepository _firebaseRepository;

  User? user;

  //VALIDATION USE
  final formKey = GlobalKey<FormState>();

  //TEXT CLEAR AND GET
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // PROGRESSBAR
  /*final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
    get statusProgressBar => _statusProgressBarRx.value; //GET DATA
  */

  //RX GET AND SET
  final Rxn<User> _firebaseUser = Rxn<User>();
  String? get email => _firebaseUser.value?.email;

  late AnimationController loginButtonController;

  //CONSTRUCTOR
  LoginController(this._networkRepository, this._firebaseRepository);

  //PAGE LAUNCH FIRST SCROLL
  @override
  void onInit() {
    super.onInit();
    loginButtonController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    _firebaseUser.bindStream(_firebaseRepository.authStateChange());
  }

  String? emailValidation(String? value) => Validator.validateEmail(value);

  // LOGIN VALIDATION CHECK THE FORM
  Future<void> loginValidateCheck(Function loading) async {

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      loading(true);

      _networkRepository.postMethod(
          baseUrl: ServerString.postUrl,
          success: (value) {
            loading(false);

            //SESSION STORE DATA
            _storage.saveValue(SessionString.isLoginSession, true);
            _storage.saveValue(SessionString.userIdSession, '');
            _storage.saveValue(SessionString.userNameSession, '');
            _storage.saveValue(SessionString.emailSession, '');

            AppRoute.HOME.changeScreen();
          },
          error: (error) {
            loading(false);
          });
    }
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
          fail!(ValueString.loginCancelToast);
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
        fail!(ValueString.loginCancelToast);
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
    loginButtonController.dispose();

    emailController.dispose();
    passwordController.dispose();
  }
}
