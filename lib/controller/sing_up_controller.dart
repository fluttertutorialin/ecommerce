import 'package:ecommerce/import_package.dart';
import 'package:ecommerce/model/sent/sent_package.dart' show LoginParameter;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpController extends GetxController with SingleGetTickerProviderMixin {
  late final NetworkRepository _networkRepository;
  late final Storage _storage;
  late final FirebaseRepository _firebaseRepository;

  late User? user;

  //VALIDATION USE
  final formKey = GlobalKey<FormState>();

  //TEXT CLEAR AND GET
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // PROGRESSBAR
  /*final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
    get statusProgressBar => _statusProgressBarRx.value; //GET DATA
  */

  late AnimationController singUpButtonController;

  //CONSTRUCTOR
  SignUpController(this._networkRepository, this._firebaseRepository);

  //PAGE LAUNCH FIRST SCROLL
  @override
  void onInit() {
    super.onInit();
    singUpButtonController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
  }

  String? emailValidation(String? value) => Validator.validateEmail(value);

  String? passwordValidation(String? value) => Validator.validatePassword(value);

  String? userNameValidation(String? value) => Validator.validateUserName(value);

  String? mobileValidation(String? value) => Validator.validateMobile(value);

  // LOGIN VALIDATION CHECK THE FORM
  Future<void> signUpValidateCheck(Function loading) async {

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


  //CLEAR RESOURCE
  @override
  void onClose() {
    super.onClose();
    singUpButtonController.dispose();

    emailController.dispose();
    passwordController.dispose();
  }
}
