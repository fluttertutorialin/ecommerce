import '../import_package.dart';
import '../model/sent/sent_package.dart' show LoginParameter;
import '../base/base_controller.dart';

class LoginController extends BaseController
    with SingleGetTickerProviderMixin {
  static LoginController get to => Get.find();

  //TEXT CLEAR AND GET
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //PASSWORD VISIBLE OR NOT
  final _passwordVisible = false.obs;
  get passwordVisible => this._passwordVisible.value;
  set passwordVisible(value) => this._passwordVisible.value = value;

  final _email = "".obs;
  get email => this._email.value;
  set email(value) => this._email.value = value;

  final _password = "".obs;
  get password => this._password.value;
  set password(value) => this._password.value = value;

  ///ON PRESS VALIDATION CHECK
  //bool get isEmailValid => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);

  //RX GET AND SET
  /*final Rxn<User> _firebaseUser = Rxn<User>();
    String? get email => _firebaseUser.value?.email;
  */

  late AnimationController loginButtonController;

  //PAGE LAUNCH FIRST SCROLL
  @override
  void onInit() {
    super.onInit();
    loginButtonController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    //_firebaseUser.bindStream(_firebaseRepository.authStateChange());
  }

  //STORE TEXT-FIELD ON CHANGE VALUE
  void setEmail(String? value) => email = value;
  void setPassword(String? value) => password = value;

  //VALIDATION
  String? emailValidation(String? value) => Validator.validateEmail(value);
  String? passwordValidation(String? value) => Validator.validatePassword(value);

  // LOGIN VALIDATION CHECK THE FORM
  Future<void> loginResponseAPI(Function loading) async {
    loading(true);

    //LOGIN API CALL
    getAPI(success: (value){
      loading(false);
      loginSignUpSession();
      AppRoute.HOME.offAllNamed();
    }, error: (error){
      loading(false);
      passwordController.clear();
    });
  }

  //LOGIN BY FACEBOOK
  Future<void> loginFB({Function? success, Function? fail, context}) async {
    /*try {
      final result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final accessToken = await FacebookAuth.instance.accessToken;
          firebaseRepository.loginFirebaseFacebook(token: accessToken!.token);

          break;

        case LoginStatus.cancelled:
          fail!(ValueString.loginCancelToast);
          break;
        default:
          break;
      }
    } catch (error) {
      fail!(error);
    }*/
  }

  //LOGIN BY GOOGLE
  Future<void> loginGoogle({Function? success, Function? fail, context}) async {
    /*try {
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
    }*/
  }

  //LOGIN BY APPLICATION
  loginApplication() async {
    var loginParameter = LoginParameter(
        email: email,
        password: password.duSHA256());

    // SENT API PARAMETER (FOR EXAMPLE BODY) JSON FORMAT
    loginParameter.toJson();

    //LOGIN SUCCESS GO TO MAIN SCREEN
    Get.offAllNamed(AppRoute.HOME);
  }

  signUpNavigation() => AppRoute.SIGNUP.changeScreen();

  //CLEAR RESOURCE
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
